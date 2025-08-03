import 'dart:convert';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;
import 'UserModel.dart';

class UserService {
  static Future<List<UserModel>> fetchUsers({String? search}) async {
    final token = ApiConstances.getToken();
    final response = await http.get(Uri.parse(ApiConstances.usersUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List users = jsonData['data']['data'];
      return users.map((u) => UserModel.fromJson(u)).toList();
    } else {
      throw Exception('فشل في تحميل المستخدمين');
    }
  }
}
