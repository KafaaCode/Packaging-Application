// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:frip_trading/core/error/error_message.dart';

class ServerException implements Exception {
  final int? statusCode;
  final ErrorMessageModel errorMessageModel;

  const ServerException(
      {required this.statusCode, required this.errorMessageModel});
}

class AuthException implements Exception {
  final int? statusCode;
  final String authMessage;

  // دالة بناء مصنعية يمكن أن تستخدم نفس المنطق المذكور في ServerException
  // لكنها تسمح لك بتحديد رسالة أكثر تركيزاً على التوثيق عند الحاجة.
  factory AuthException.fromStatusCode(int statusCode, {String? authMessage}) {
    if (statusCode == 401) {
      return AuthException(
        statusCode: statusCode,
        authMessage: authMessage ??
            'فشل في المصادقة. يرجى التأكد من اسم المستخدم وكلمة المرور.',
      );
    }
    // يمكن تمرير الـ 403 أيضاً إذا كانت خاصة بالصلاحيات
    if (statusCode == 403) {
      return AuthException(
        statusCode: statusCode,
        authMessage: 'لا تملك الصلاحيات اللازمة لإجراء هذه العملية.',
      );
    }

    return AuthException(
      statusCode: statusCode,
      authMessage: authMessage ?? 'حدث خطأ في عملية المصادقة ($statusCode).',
    );
  }

  AuthException({
    required this.statusCode,
    required this.authMessage,
  });

  @override
  String toString() =>
      'AuthException(statusCode: $statusCode, message: $authMessage)';
}
