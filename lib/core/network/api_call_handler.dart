import 'package:dio/dio.dart';
import 'package:frip_trading/core/error/exceptions.dart';
import 'package:frip_trading/src/data/data_source/auth_remote_data_source.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ApiCallHandler {
  final BaseAuthRemoteDataSource authDataSource;
  ApiCallHandler({required this.authDataSource});

  Future<T> handler<T>({
    required Future<Response> Function() apiCall,
    required T Function(Response) responseHandler,
  }) async {
    try {
      final response = await apiCall();

      if (response.statusCode == 422) {
        final Map<String, dynamic> errors = response.data['errors'] ?? {};
        final String errorMessage = errors.values
            .expand((e) => e is List ? e : [e.toString()])
            .join(', ');

        print(response.data);
        throw AuthException(
          statusCode: 422,
          authMessage: errorMessage.isNotEmpty
              ? errorMessage
              : 'Validation error occurred',
        );
      }

      if (response.statusCode == 401) {
        final refreshToken = await authDataSource.refreshToken();
        await HydratedBloc.storage.write('token', refreshToken.token);
        return handler(
          apiCall: apiCall,
          responseHandler: responseHandler,
        );
      }
      print(response.data);
      return responseHandler(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final refreshToken = await authDataSource.refreshToken();
        await HydratedBloc.storage.write('token', refreshToken.token);
        return handler(
          apiCall: apiCall,
          responseHandler: responseHandler,
        );
      } else {
        print(e.message);
        throw AuthException(
            statusCode: e.response?.statusCode ?? 404, authMessage: e.message);
      }
    }
  }
}
