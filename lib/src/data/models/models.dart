
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
    required String role,
    String? gander,
    String? company,
    String? specialization,
    String? country,
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
    required String token,
    String? message,
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
    required int id,
    required String name,
    required String image,
    
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
    required String serial_numbe,
   String?  description,
   required Category cateogry,
    required int request_number,
   required double  price,
    required bool intactive,  
  }) =_Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}