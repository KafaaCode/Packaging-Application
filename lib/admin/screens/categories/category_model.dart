import 'package:frip_trading/admin/screens/constants.dart';

class CategoryModel {
  final int id;
  final String name;
  final String? image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] != null ? '$imageBaseUrl${json['image']}' : null,
    );
  }
}
