class OrderModel {
  final String serialNumber;
  final String createdAt;
  final String status;
  final int id;
  final String user_name;

  OrderModel({
    required this.serialNumber,
    required this.createdAt,
    required this.status,
    required this.id,
    required this.user_name,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      serialNumber: json['serial_number'],
      createdAt: json['created_at'],
      user_name: json['user_name'],
      status: json['status'],
      id: json['id'],
    );
  }
}
