class ProductModel {
  final int id;
  final String name;
  final String serialNumber;
  final String description;
  final int categoryId;
  final String image;
  final int? requestNumber;
  final double price;
  final bool active;

  ProductModel({
    required this.id,
    required this.name,
    required this.serialNumber,
    required this.description,
    required this.categoryId,
    required this.image,
    this.requestNumber,
    required this.price,
    required this.active,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: _toInt(json['id']),
      name: json['name'] ?? '',
      serialNumber: json['serial_number'] ?? '',
      description: json['description'] ?? '',
      categoryId: _toInt(json['category_id']),
      image: json['image'] ?? '',
      requestNumber: _toIntOrNull(json['request_number']),
      price: _toDouble(json['price']),
      active: json['active'] == true || json['active'] == 1,
    );
  }

  static int _toInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    if (value is double) return value.toInt();
    return 0;
  }

  static int? _toIntOrNull(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is double) return value.toInt();
    return null;
  }

  static double _toDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
