class UserModel {
  final int id;
  final String name;
  final String email;
  final String createdAt;
  final int? status;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      createdAt: json['created_at'] ?? '',
      status: json['status'],
    );
  }
}
