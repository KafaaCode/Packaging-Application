import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class RefreshToken with _$RefreshToken {
  const factory RefreshToken({
    required String token,
    required String message,
  }) = _RefreshToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    String? companyName,
    int? status,
    String? role,
    String? gander,
    String? company,
    @JsonKey(name: "specialization_id") int? specializationId,
    @JsonKey(name: 'country_id') int? countryId,
    String? image,
    String? phoneNumber,
    String? password,
    @Default(false) bool? checkIsTerms,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Auth with _$Auth {
  const factory Auth({
    required User user,
    @JsonKey(name: 'access_token') String? token,
    String? role,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
class UpdateData with _$UpdateData {
  const factory UpdateData({
    required User user,
    String? message,
  }) = _UpdateData;

  factory UpdateData.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
   int? id,
  String? name,
     String? image,

     required int active,  
    
  }) =_Category;


  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    String? image,
    String? serial_numbe,
    String? description,
   Category? cateogry,
    int? request_number, 

   required String  price,
  required int active,  
  }) =_Product;


  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class MyOrder with _$MyOrder  {
  const factory MyOrder ({
    required int id,
    required String status,
    required String serial_number,
    required String delivery_time,
    
    DateTime? created_at,
  }) =_MyOrder;

  factory MyOrder.fromJson(Map<String, dynamic> json) =>
      _$MyOrderFromJson(json);
}


