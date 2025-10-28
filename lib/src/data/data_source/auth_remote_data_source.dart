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
  // تأكد من استيراد ملف الاستثناءات الخاص بك هنا
// import 'package:frip_trading/core/error/exceptions.dart';

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

      print(response.data);

      // 1. حالة النجاح (200 أو 201)
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Auth.fromJson(response.data['data']);
      }

      // 2. حالة خطأ التحقق من الصحة (Validation Error - 422)
      if (response.statusCode == 422) {
        // بما أنك تريد رسالة موحدة، لن نستخدم رسائل الأخطاء التفصيلية للـ422
        // سنعتمد على رسالة AuthException الموحدة للـ 422.
        // إذا لم تكن قد عرفت رسالة خاصة للـ 422 في AuthException، ستُستخدم الرسالة الافتراضية.
        throw AuthException.fromStatusCode(422);
      }
      if (response.statusCode == 401) {
        throw AuthException.fromStatusCode(401);
      }

      // 3. حالات الأخطاء الأخرى (400, 401, 403, 500, إلخ...)
      // **نعتمد هنا فقط على الـ statusCode لتحديد الرسالة الموحدة.**
      throw AuthException.fromStatusCode(
        response.statusCode ?? 400,
        // لا نمرر أي رسالة (authMessage) للـ factory constructor
        // لضمان استخدام الرسالة المحددة لكل Status Code في ملف Exceptions.
      );
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      print('Response data: ${e.response?.data}');

      final int statusCode = e.response?.statusCode ?? 0;

      // **التعامل مع DioException:** نعتمد على الـ statusCode فقط.
      if (statusCode != 0) {
        throw AuthException.fromStatusCode(
          statusCode,
          // لا نمرر أي رسالة لضمان استخدام الرسائل الموحدة.
        );
      } else {
        // خطأ شبكة (Network Error) أو timeout
        throw AuthException.fromStatusCode(
          0,
          authMessage:
              'فشل في الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت.',
        );
      }
    } catch (e) {
      print('Unexpected error: $e');
      // خطأ غير متوقع بالكامل
      throw AuthException.fromStatusCode(
        401, // رمز غير قياسي للإشارة لخطأ غير متوقع
        // authMessage: 'حدث خطأ غير متوقع في التطبيق. يرجى المحاولة لاحقاً.',
      );
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
