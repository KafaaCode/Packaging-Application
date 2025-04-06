import 'package:dio/dio.dart';
import 'package:frip_trading/core/error/exceptions.dart';
import 'package:frip_trading/core/network/api_call_handler.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/src/data/models/models.dart';
import '../../../../core/services/services_locator.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Auth> register({required User user});
  Future<UpdateData> update({required User user});
  Future<UpdateData> updateProfile({required String path});
  Future<Auth> login({required String email, required String password});
  Future<RefreshToken> refreshToken();
  Future<bool> logout();
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
        return Auth.fromJson(response.data);
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['message'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw AuthException.fromDioError(e.response?.statusCode ?? 404, e);
    } catch (e) {
      print('Unexpected error: $e');
      throw AuthException(statusCode: 404, authMessage: e.toString());
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final response = await Dio().post(ApiConstances.logoutUrl,
          options: Options(
            headers: ApiConstances.headers(
                isToken: true, token: ApiConstances.getToken()),
            validateStatus: (status) => status! < 500,
          ));
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
        return true;
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['message'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw AuthException.fromDioError(e.response?.statusCode ?? 404, e);
    } catch (e) {
      print('Unexpected error: $e');
      throw AuthException(statusCode: 404, authMessage: e.toString());
    }
  }

  @override
  Future<RefreshToken> refreshToken() async {
    try {
      print('-------refreshToken------');
      final response = await Dio().post(
        ApiConstances.refreshTokenUrl,
        options: Options(
          headers: ApiConstances.headers(
              isToken: true, token: ApiConstances.getToken()),
          validateStatus: (status) => status! < 500,
        ),
      );
      print('Response data: ${response.data}');
      print('Response status code: ${response.statusCode}');
      print('-------refreshToken------');
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
        return RefreshToken.fromJson(response.data);
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['message'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw AuthException.fromDioError(e.response?.statusCode ?? 404, e);
    } catch (e) {
      print('Unexpected error: $e');
      throw AuthException(statusCode: 404, authMessage: e.toString());
    }
  }

  @override
  Future<Auth> register({required User user}) async {
    try {
      final requestBody = FormData.fromMap({
        // 'name': user.name,
        // 'email': user.email,
        // 'password': user.password,
        // 'password_confirmation': user.password,
        // 'region_id': user.region,
        // 'gander': user.gander,
        // 'phoneNumber': user.phoneNumber,
      });
      print(requestBody);
      final response = await Dio().post(
        ApiConstances.registerUrl,
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

      // Handle successful response
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Auth.fromJson(response.data);
      }

      throw AuthException(
        statusCode: response.statusCode ?? 400,
        authMessage: response.data['errors'] ?? 'Unknown error occurred',
      );
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw AuthException.fromDioError(e.response?.statusCode ?? 404, e);
    } catch (e) {
      print('Unexpected error: $e');
      throw AuthException(statusCode: 404, authMessage: e.toString());
    }
  }

  @override
  Future<UpdateData> update({required User user}) async {
    final requestBody = FormData.fromMap({
      // 'name': user.name,
      // // 'email': user.email,
      // 'password': user.password,
      // // 'password_confirmation': user.password,
      // // 'region_id': user.region,
      // 'gander': user.gander,
      // 'phoneNumber': user.phoneNumber,
    });
    print(requestBody);
    return sl.get<ApiCallHandler>().handler(
          apiCall: () async => await Dio().post(
            "",
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
  }

  @override
  Future<UpdateData> updateProfile({required String path}) async {
    final requestBody = FormData.fromMap({
      'image': await MultipartFile.fromFile(path),
    });
    print(requestBody);
    return sl.get<ApiCallHandler>().handler(
          apiCall: () async => await Dio().post(
            '',
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
  }
}
