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
      companyName: json['companyName'] as String?,
      status: (json['status'] as num?)?.toInt(),
      role: json['role'] as String?,
      gander: json['gander'] as String?,
      company: json['company'] as String?,
      specializationId: (json['specialization_id'] as num?)?.toInt(),
      countryId: (json['country_id'] as num?)?.toInt(),
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
      'companyName': instance.companyName,
      'status': instance.status,
      'role': instance.role,
      'gander': instance.gander,
      'company': instance.company,
      'specialization_id': instance.specializationId,
      'country_id': instance.countryId,
      'image': instance.image,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'checkIsTerms': instance.checkIsTerms,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['access_token'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.token,
      'role': instance.role,
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
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      active: (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'active': instance.active,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String?,
      serial_numbe: json['serial_numbe'] as String?,
      description: json['description'] as String?,
      cateogry: json['cateogry'] == null
          ? null
          : Category.fromJson(json['cateogry'] as Map<String, dynamic>),
      request_number: (json['request_number'] as num?)?.toInt(),
      price: json['price'] as String,
      active: (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'serial_numbe': instance.serial_numbe,
      'description': instance.description,
      'cateogry': instance.cateogry,
      'request_number': instance.request_number,
      'price': instance.price,
      'active': instance.active,
    };

_$MyOrderImpl _$$MyOrderImplFromJson(Map<String, dynamic> json) =>
    _$MyOrderImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      serial_number: json['serial_number'] as String,
      delivery_time: json['delivery_time'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$MyOrderImplToJson(_$MyOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'serial_number': instance.serial_number,
      'delivery_time': instance.delivery_time,
      'created_at': instance.created_at?.toIso8601String(),
    };
