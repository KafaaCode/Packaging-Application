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
      user: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$UpdateDataImplToJson(_$UpdateDataImpl instance) =>
    <String, dynamic>{
      'data': instance.user,
      'message': instance.message,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] != null ? '$imageBaseUrl${json['image']}' : null,
      active: (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'active': instance.active,
    };

_$SpecializationAndCountryImpl _$$SpecializationAndCountryImplFromJson(
        Map<String, dynamic> json) =>
    _$SpecializationAndCountryImpl(
      country: (json['countries'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialization: (json['specializations'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Specialization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SpecializationAndCountryImplToJson(
        _$SpecializationAndCountryImpl instance) =>
    <String, dynamic>{
      'countries': instance.country,
      'specializations': instance.specialization,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$SpecializationImpl _$$SpecializationImplFromJson(Map<String, dynamic> json) =>
    _$SpecializationImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SpecializationImplToJson(
        _$SpecializationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] != null ? '$imageBaseUrl${json['image']}' : null,
      serial_numbe: json['serial_numbe'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      request_number: (json['request_number'] as num?)?.toInt(),
      price: json['price'] as String,
      active: (json['active'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'serial_numbe': instance.serial_numbe,
      'description': instance.description,
      'category': instance.category,
      'request_number': instance.request_number,
      'price': instance.price,
      'active': instance.active,
      'quantity': instance.quantity,
    };

_$MyOrderImpl _$$MyOrderImplFromJson(Map<String, dynamic> json) =>
    _$MyOrderImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String?,
      serial_number: json['serial_number'] as String?,
      delivery_time: json['delivery_time'] as String?,
      total_price: json['total_price'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'total_price': instance.total_price,
      'products': instance.products,
      'created_at': instance.created_at?.toIso8601String(),
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
