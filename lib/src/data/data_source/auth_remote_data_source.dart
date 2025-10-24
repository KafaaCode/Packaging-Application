import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frip_trading/core/error/exceptions.dart';
import 'package:frip_trading/core/network/api_call_handler.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/src/data/models/models.dart';
import '../../../../core/services/services_locator.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Auth> register(
      {required String companyName,
      required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required int specId,
      required int countryId});
  Future<UpdateData> update({required User user});
  Future<UpdateData> updateProfile(
      {String? companyName,
      String? name,
      String? email,
      int? specializationId,
      int? countryId});
  Future<Auth> login({required String email, required String password});
  Future<String> updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<RefreshToken> refreshToken();
  Future<bool> logout();
  Future<bool> deleteAccount();
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<Auth> login({required String email, required String password}) async {
    try {
      final Map<String, dynamic> requestBody = {
        'email': email,
        'password': password,
      };
      final response = await Dio().post(
        ApiConstances.loginUrl,
        options: Options(
          headers: ApiConstances.headers(isToken: false),
          validateStatus: (status) => status! < 500,
        ),
        data: requestBody,
      );
      if (response.statusCode == 422) {
        final Map<String, dynamic> errors = response.data['errors'] ?? {};
        final String errorMessage = errors.values
            .expand((e) => e is List ? e : [e.toString()])
            .join(', ');
        throw AuthException(
          statusCode: 422,
          authMessage: errorMessage.isNotEmpty
              ? errorMessage
              : 'Validation error occurred',
        );
      }
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Auth.fromJson(response.data['data']);
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['message'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw AuthException(
          statusCode: e.response?.statusCode, authMessage: e.response?.data);
    } catch (e) {
      print('Unexpected error: $e');
      throw AuthException(statusCode: 404, authMessage: e.toString());
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final response = await Dio().post(
        ApiConstances.logoutUrl,
        options: Options(
          headers: ApiConstances.headers(
              isToken: true, token: ApiConstances.getToken()),
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['message'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        authMessage: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<RefreshToken> refreshToken() async {
    try {
      final response = await Dio().post(
        ApiConstances.refreshTokenUrl,
        options: Options(
          headers: ApiConstances.headers(
              isToken: true, token: ApiConstances.getToken()),
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RefreshToken.fromJson(response.data);
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['message'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        authMessage: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<Auth> register(
      {required String companyName,
      required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required int specId,
      required int countryId}) async {
    try {
      final requestBody = {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
        'companyName': companyName,
        'specialization_id': specId,
        'country_id': countryId,
      };

      final response = await Dio().post(
        ApiConstances.registerUrl,
        options: Options(
          headers: ApiConstances.headers(isToken: false),
          validateStatus: (status) => status! < 500,
        ),
        data: requestBody,
      );
      print('---REQUEST BODY ---');
      print(requestBody);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 422) {
        final Map<String, dynamic> errors = response.data['errors'] ?? {};
        final String errorMessage = errors.values
            .expand((e) => e is List ? e : [e.toString()])
            .join(', ');
        throw AuthException(
          statusCode: 422,
          authMessage: errorMessage.isNotEmpty
              ? errorMessage
              : 'Validation error occurred',
        );
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Auth.fromJson(response.data['data']);
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['errors'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        authMessage: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<UpdateData> update({required User user}) async {
    try {
      final requestBody = FormData.fromMap({
        'name': user.name,
        'email': user.email,
        'companyName': user.companyName,
        'specialization_id': user.specializationId,
        'country_id': user.countryId,
      });

      return sl.get<ApiCallHandler>().handler(
            apiCall: () async => await Dio().put(
              ApiConstances.updateUrl,
              options: Options(
                headers: ApiConstances.headers(
                    isToken: true, token: ApiConstances.getToken()),
                validateStatus: (status) => status! < 500,
              ),
              data: requestBody,
            ),
            responseHandler: (response) {
              return UpdateData.fromJson(response.data);
            },
          );
    } on DioException catch (e) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        authMessage: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<UpdateData> updateProfile(
      {String? companyName,
      String? name,
      String? email,
      int? specializationId,
      int? countryId}) async {
    try {
      final requestBody = {
        'name': name,
        'email': email,
        'companyName': companyName,
        'specialization_id': specializationId,
        'country_id': countryId,
      };
      print(requestBody);
      return sl.get<ApiCallHandler>().handler(
            apiCall: () async => await Dio().put(
              ApiConstances.updateUrl,
              options: Options(
                headers: ApiConstances.headers(
                    isToken: true, token: ApiConstances.getToken()),
                validateStatus: (status) => status! < 500,
              ),
              data: requestBody,
            ),
            responseHandler: (response) {
              return UpdateData.fromJson(response.data);
            },
          );
    } on DioException catch (e) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        authMessage: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<String> updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      final requestBody = {
        'current_password': oldPassword,
        'new_password': newPassword,
        'new_password_confirmation': confirmPassword,
      };

      return sl.get<ApiCallHandler>().handler(
            apiCall: () async => await Dio().post(
              ApiConstances.updatePasswordUrl,
              options: Options(
                headers: ApiConstances.headers(
                    isToken: true, token: ApiConstances.getToken()),
                validateStatus: (status) => status! < 500,
              ),
              data: requestBody,
            ),
            responseHandler: (response) {
              return response.data['message'];
            },
          );
    } on DioException catch (e) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        authMessage: e.response?.data['message'] ?? e.message,
      );
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<bool> deleteAccount() async {
    try {
      return sl<ApiCallHandler>().handler(
        apiCall: () async => await Dio().delete(
          ApiConstances.deleteAccount,
          options: Options(
              headers: ApiConstances.headers(
                  isToken: true, token: ApiConstances.getToken())),
        ),
        responseHandler: (response) {
          return true;
        },
      );
    } on DioException catch (e) {
      throw AuthException(
          authMessage: e.response?.data['message'],
          statusCode: e.response?.statusCode);
    } catch (e) {
      throw AuthException(
        statusCode: 500,
        authMessage: 'Unexpected Error: $e',
      );
    }
  }
}
