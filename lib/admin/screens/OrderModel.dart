class OrderModel {
  final String serialNumber;
  final String createdAt;
  final String status;

  OrderModel({
    required this.serialNumber,
    required this.createdAt,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      serialNumber: json['serial_number'],
      createdAt: json['created_at'],
      status: json['status'],
    );
  }
}
