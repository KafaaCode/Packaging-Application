
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
  final List<String>? images;

  ProductModel({
    required this.id,
    required this.name,
    required this.serialNumber,
    required this.description,
    required this.categoryId,
    required this.image,
    this.requestNumber,
    this.images,
    required this.price,
    required this.active,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? imagesJson = json['images'];
    List<String>? imagesList;
    if (imagesJson is List && imagesJson.isNotEmpty) {
      imagesList = imagesJson
          // نأخذ كل كائن (Map)
          .map((e) {
            // نتحقق إذا كان الكائن Map ونستخرج قيمة 'path'
            if (e is Map<String, dynamic> && e.containsKey('path')) {
              return e['path']?.toString() ??
                  ''; // نضمن أنها String أو سلسلة فارغة
            }
            return '';
          })
          // نزيل أي سلاسل فارغة نتجت عن مشكلة في الـ path
          .where((path) => path.isNotEmpty)
          .toList();

      // إذا كانت القائمة الناتجة فارغة بعد التنقية، نرجع null بدلاً من القائمة الفارغة
      if (imagesList.isEmpty) {
        imagesList = null;
      }
    }
    return ProductModel(
      id: _toInt(json['id']),
      name: json['name'] ?? '',
      images: imagesList,
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

// class CartItems  {
//    // ضروري لإضافة getter

//    factory CartItems({
//     required ProductModel product,
//     required int quantity,
//   })

//   factory CartItem.fromJson(Map<String, dynamic> json) =>
//       _$CartItemFromJson(json);

//   double get total_price => double.parse(product.price) * quantity;
// }

class CartItems {
  final ProductModel productModel;
  final int quantity;
  CartItems({required this.productModel, required this.quantity});

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return CartItems(quantity: json['quantity'], productModel: json['product']);
  }
}
