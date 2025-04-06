import 'package:hydrated_bloc/hydrated_bloc.dart';

class ApiConstances {
  static const String _baseUrl = "http://192.168.22.7:8000/api";

  static Map<String, dynamic> headers(
      {bool? isToken = true, String? token, bool? isMulti = false}) {
    if (!isToken!) {
      return {"accept": "application/json"};
    } else {
      if (isMulti == true) {
        return {
          "accept": "multipart/form-data",
          "Authorization": "Bearer $token"
        };
      }
      return {
        "accept": "application/json",
        "Authorization": "Bearer $token",
      };
    }
  }

  // Authentication
  static const String registerUrl = "$_baseUrl/auth/register";
  static const String loginUrl = "$_baseUrl/auth/login";
  static const String logoutUrl = "$_baseUrl/logout";
  static const String refreshTokenUrl = "$_baseUrl/auth/refreshToken";
  static const String getRegionUrl = "$_baseUrl/Region";
  // Main

  // Tools
  static String getToken() {
    print(HydratedBloc.storage.read('token').toString());

    if (HydratedBloc.storage.read('token') == null) {
      return '';
    }
    return HydratedBloc.storage.read('token').toString();
  }
}
