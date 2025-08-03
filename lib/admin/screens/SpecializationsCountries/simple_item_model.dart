// models/simple_item_model.dart

class SimpleItemModel {
  final int id;
  final String name;

  SimpleItemModel({required this.id, required this.name});

  factory SimpleItemModel.fromJson(Map<String, dynamic> json) {
    return SimpleItemModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
