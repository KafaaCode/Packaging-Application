import 'package:hydrated_bloc/hydrated_bloc.dart';

class ApiConstances {
  static const String _baseUrl = "https://friptrading.com/api";

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
  static const String registerUrl = "$_baseUrl/register";
  static const String loginUrl = "$_baseUrl/login";
  static const String logoutUrl = "$_baseUrl/logout";
  static const String refreshTokenUrl = "$_baseUrl/refreshToken";
  static const String updatePasswordUrl = "$_baseUrl/change-password";
  static const String updateUrl = "$_baseUrl/profile";
  static const String sendSupportUrl = "$_baseUrl/supports";
  static const String sspecializationsAndCountryUrl =
      "$_baseUrl/specialization-and-country";

  // Main

  static const String getcategoriesUrl = "$_baseUrl/categories";

  static const String getordersUrl = "$_baseUrl/orders";
  static const String addOrdertUrl = "$_baseUrl/orders";

  static String getproductsUrl({required int categoryId}) =>
      "$_baseUrl/products/categories/$categoryId";
  // Tools
  static String getToken() {
    print(HydratedBloc.storage.read('token').toString());

    if (HydratedBloc.storage.read('token') == null) {
      return '';
    }
    return HydratedBloc.storage.read('token').toString();
  }
}
