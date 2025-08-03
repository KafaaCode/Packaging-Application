import 'dart:convert';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;
import 'category_model.dart';

class CategoryController {
  Future<List<CategoryModel>> fetchCategories() async {
    final url = Uri.parse('$apiBaseUrl/admin/categories');
    final token = ApiConstances.getToken();
    print(url);
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData['data'];
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    final url = Uri.parse(
        '$apiBaseUrl/admin/categories/$categoryId'); // Construct the URL with the category ID
    final token = ApiConstances.getToken(); // Get the authorization token

    print('Attempting to DELETE category at URL: $url');
    print('Using Authorization Token: Bearer $token');

    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token', // Use the token for authorization
          'Accept': 'application/json', // Consistent with your fetchCategories
        },
      );

      if (response.statusCode == 200) {
        // Category deleted successfully
        print('Category with ID $categoryId deleted successfully.');
        // You might want to return a success message or a boolean
      } else if (response.statusCode == 404) {
        // Category not found
        print('Error: Category with ID $categoryId not found.');
        print('Response body: ${response.body}');
        throw Exception('Category not found: ${response.statusCode}');
      } else {
        // Other error occurred
        print(
            'Failed to delete category $categoryId. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to delete category: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or other exceptions
      print('An error occurred while deleting category: $e');
      throw Exception('Network error or other issue: $e');
    }
  }
}
