import 'dart:convert';
import 'package:frip_trading/admin/screens/Supports/SupportModel.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;

class SupportService {
  static Future<List<SupportModel>> fetchSupports() async {
    final token = ApiConstances.getToken();
    final response = await http.get(Uri.parse(ApiConstances.supportsUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print(response.body);
      final List supports = body['data'];
      return supports.map((json) => SupportModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load supports');
    }
  }
}
