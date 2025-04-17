// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenImpl _$$RefreshTokenImplFromJson(Map<String, dynamic> json) =>
    _$RefreshTokenImpl(
      token: json['token'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$RefreshTokenImplToJson(_$RefreshTokenImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'message': instance.message,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      gander: json['gander'] as String?,
      company: json['company'] as String?,
      specialization: json['specialization'] as String?,
      country: json['country'] as String?,
      image: json['image'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      checkIsTerms: json['checkIsTerms'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'gander': instance.gander,
      'company': instance.company,
      'specialization': instance.specialization,
      'country': instance.country,
      'image': instance.image,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'checkIsTerms': instance.checkIsTerms,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'message': instance.message,
    };

_$UpdateDataImpl _$$UpdateDataImplFromJson(Map<String, dynamic> json) =>
    _$UpdateDataImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$UpdateDataImplToJson(_$UpdateDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'message': instance.message,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      minimumOrder: (json['minimumOrder'] as num?)?.toInt(),
      name: json['name'] as String,
      image: json['image'] as String?,
      serial_numbe: json['serial_numbe'] as String,
      description: json['description'] as String?,
      cateogry: Category.fromJson(json['cateogry'] as Map<String, dynamic>),
      request_number: (json['request_number'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      intactive: json['intactive'] as bool,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minimumOrder': instance.minimumOrder,
      'name': instance.name,
      'image': instance.image,
      'serial_numbe': instance.serial_numbe,
      'description': instance.description,
      'cateogry': instance.cateogry,
      'request_number': instance.request_number,
      'price': instance.price,
      'intactive': instance.intactive,
    };
