class SupportModel {
  final int id;
  final String title;
  final String message;
  final String senderName;
  final String senderEmail;
  final String createdAt;

  SupportModel({
    required this.id,
    required this.title,
    required this.message,
    required this.senderName,
    required this.senderEmail,
    required this.createdAt,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      senderName: json['sender_name'],
      senderEmail: json['sender_email'],
      createdAt: json['created_at'],
    );
  }
}
