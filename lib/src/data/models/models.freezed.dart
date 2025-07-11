// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) {
  return _RefreshToken.fromJson(json);
}

/// @nodoc
mixin _$RefreshToken {
  String get token => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this RefreshToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenCopyWith<RefreshToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res, RefreshToken>;
  @useResult
  $Res call({String token, String message});
}

/// @nodoc
class _$RefreshTokenCopyWithImpl<$Res, $Val extends RefreshToken>
    implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenImplCopyWith<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  factory _$$RefreshTokenImplCopyWith(
          _$RefreshTokenImpl value, $Res Function(_$RefreshTokenImpl) then) =
      __$$RefreshTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String message});
}

/// @nodoc
class __$$RefreshTokenImplCopyWithImpl<$Res>
    extends _$RefreshTokenCopyWithImpl<$Res, _$RefreshTokenImpl>
    implements _$$RefreshTokenImplCopyWith<$Res> {
  __$$RefreshTokenImplCopyWithImpl(
      _$RefreshTokenImpl _value, $Res Function(_$RefreshTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? message = null,
  }) {
    return _then(_$RefreshTokenImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenImpl implements _RefreshToken {
  const _$RefreshTokenImpl({required this.token, required this.message});

  factory _$RefreshTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenImplFromJson(json);

  @override
  final String token;
  @override
  final String message;

  @override
  String toString() {
    return 'RefreshToken(token: $token, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, message);

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenImplCopyWith<_$RefreshTokenImpl> get copyWith =>
      __$$RefreshTokenImplCopyWithImpl<_$RefreshTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenImplToJson(
      this,
    );
  }
}

abstract class _RefreshToken implements RefreshToken {
  const factory _RefreshToken(
      {required final String token,
      required final String message}) = _$RefreshTokenImpl;

  factory _RefreshToken.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenImpl.fromJson;

  @override
  String get token;
  @override
  String get message;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenImplCopyWith<_$RefreshTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get gander => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  @JsonKey(name: "specialization_id")
  int? get specializationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int? get countryId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  bool? get checkIsTerms => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
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
      bool? checkIsTerms,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? companyName = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? gander = freezed,
    Object? company = freezed,
    Object? specializationId = freezed,
    Object? countryId = freezed,
    Object? image = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? checkIsTerms = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      gander: freezed == gander
          ? _value.gander
          : gander // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      specializationId: freezed == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIsTerms: freezed == checkIsTerms
          ? _value.checkIsTerms
          : checkIsTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
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
      bool? checkIsTerms,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? companyName = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? gander = freezed,
    Object? company = freezed,
    Object? specializationId = freezed,
    Object? countryId = freezed,
    Object? image = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? checkIsTerms = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      gander: freezed == gander
          ? _value.gander
          : gander // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      specializationId: freezed == specializationId
          ? _value.specializationId
          : specializationId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIsTerms: freezed == checkIsTerms
          ? _value.checkIsTerms
          : checkIsTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.companyName,
      this.status,
      this.role,
      this.gander,
      this.company,
      @JsonKey(name: "specialization_id") this.specializationId,
      @JsonKey(name: 'country_id') this.countryId,
      this.image,
      this.phoneNumber,
      this.password,
      this.checkIsTerms = false,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? companyName;
  @override
  final int? status;
  @override
  final String? role;
  @override
  final String? gander;
  @override
  final String? company;
  @override
  @JsonKey(name: "specialization_id")
  final int? specializationId;
  @override
  @JsonKey(name: 'country_id')
  final int? countryId;
  @override
  final String? image;
  @override
  final String? phoneNumber;
  @override
  final String? password;
  @override
  @JsonKey()
  final bool? checkIsTerms;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, companyName: $companyName, status: $status, role: $role, gander: $gander, company: $company, specializationId: $specializationId, countryId: $countryId, image: $image, phoneNumber: $phoneNumber, password: $password, checkIsTerms: $checkIsTerms, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.gander, gander) || other.gander == gander) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.specializationId, specializationId) ||
                other.specializationId == specializationId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.checkIsTerms, checkIsTerms) ||
                other.checkIsTerms == checkIsTerms) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      companyName,
      status,
      role,
      gander,
      company,
      specializationId,
      countryId,
      image,
      phoneNumber,
      password,
      checkIsTerms,
      createdAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String name,
      required final String email,
      final String? companyName,
      final int? status,
      final String? role,
      final String? gander,
      final String? company,
      @JsonKey(name: "specialization_id") final int? specializationId,
      @JsonKey(name: 'country_id') final int? countryId,
      final String? image,
      final String? phoneNumber,
      final String? password,
      final bool? checkIsTerms,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get companyName;
  @override
  int? get status;
  @override
  String? get role;
  @override
  String? get gander;
  @override
  String? get company;
  @override
  @JsonKey(name: "specialization_id")
  int? get specializationId;
  @override
  @JsonKey(name: 'country_id')
  int? get countryId;
  @override
  String? get image;
  @override
  String? get phoneNumber;
  @override
  String? get password;
  @override
  bool? get checkIsTerms;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return _Auth.fromJson(json);
}

/// @nodoc
mixin _$Auth {
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String? get token => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this Auth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res, Auth>;
  @useResult
  $Res call(
      {User user, @JsonKey(name: 'access_token') String? token, String? role});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthCopyWithImpl<$Res, $Val extends Auth>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? token = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthImplCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl value, $Res Function(_$AuthImpl) then) =
      __$$AuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user, @JsonKey(name: 'access_token') String? token, String? role});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthImplCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$AuthImpl>
    implements _$$AuthImplCopyWith<$Res> {
  __$$AuthImplCopyWithImpl(_$AuthImpl _value, $Res Function(_$AuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? token = freezed,
    Object? role = freezed,
  }) {
    return _then(_$AuthImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthImpl implements _Auth {
  const _$AuthImpl(
      {required this.user,
      @JsonKey(name: 'access_token') this.token,
      this.role});

  factory _$AuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthImplFromJson(json);

  @override
  final User user;
  @override
  @JsonKey(name: 'access_token')
  final String? token;
  @override
  final String? role;

  @override
  String toString() {
    return 'Auth(user: $user, token: $token, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, token, role);

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      __$$AuthImplCopyWithImpl<_$AuthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthImplToJson(
      this,
    );
  }
}

abstract class _Auth implements Auth {
  const factory _Auth(
      {required final User user,
      @JsonKey(name: 'access_token') final String? token,
      final String? role}) = _$AuthImpl;

  factory _Auth.fromJson(Map<String, dynamic> json) = _$AuthImpl.fromJson;

  @override
  User get user;
  @override
  @JsonKey(name: 'access_token')
  String? get token;
  @override
  String? get role;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateData _$UpdateDataFromJson(Map<String, dynamic> json) {
  return _UpdateData.fromJson(json);
}

/// @nodoc
mixin _$UpdateData {
  @JsonKey(name: 'data', nullable: true)
  User? get user => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this UpdateData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateDataCopyWith<UpdateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDataCopyWith<$Res> {
  factory $UpdateDataCopyWith(
          UpdateData value, $Res Function(UpdateData) then) =
      _$UpdateDataCopyWithImpl<$Res, UpdateData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data', nullable: true) User? user, String? message});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UpdateDataCopyWithImpl<$Res, $Val extends UpdateData>
    implements $UpdateDataCopyWith<$Res> {
  _$UpdateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of UpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateDataImplCopyWith<$Res>
    implements $UpdateDataCopyWith<$Res> {
  factory _$$UpdateDataImplCopyWith(
          _$UpdateDataImpl value, $Res Function(_$UpdateDataImpl) then) =
      __$$UpdateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data', nullable: true) User? user, String? message});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UpdateDataImplCopyWithImpl<$Res>
    extends _$UpdateDataCopyWithImpl<$Res, _$UpdateDataImpl>
    implements _$$UpdateDataImplCopyWith<$Res> {
  __$$UpdateDataImplCopyWithImpl(
      _$UpdateDataImpl _value, $Res Function(_$UpdateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$UpdateDataImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateDataImpl implements _UpdateData {
  const _$UpdateDataImpl(
      {@JsonKey(name: 'data', nullable: true) this.user, this.message});

  factory _$UpdateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateDataImplFromJson(json);

  @override
  @JsonKey(name: 'data', nullable: true)
  final User? user;
  @override
  final String? message;

  @override
  String toString() {
    return 'UpdateData(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDataImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  /// Create a copy of UpdateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      __$$UpdateDataImplCopyWithImpl<_$UpdateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDataImplToJson(
      this,
    );
  }
}

abstract class _UpdateData implements UpdateData {
  const factory _UpdateData(
      {@JsonKey(name: 'data', nullable: true) final User? user,
      final String? message}) = _$UpdateDataImpl;

  factory _UpdateData.fromJson(Map<String, dynamic> json) =
      _$UpdateDataImpl.fromJson;

  @override
  @JsonKey(name: 'data', nullable: true)
  User? get user;
  @override
  String? get message;

  /// Create a copy of UpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int get active => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({int? id, String? name, String? image, int active});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? image, int active});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? active = null,
  }) {
    return _then(_$CategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl({this.id, this.name, this.image, required this.active});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final int active;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, image: $image, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, active);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {final int? id,
      final String? name,
      final String? image,
      required final int active}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  int get active;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecializationAndCountry _$SpecializationAndCountryFromJson(
    Map<String, dynamic> json) {
  return _SpecializationAndCountry.fromJson(json);
}

/// @nodoc
mixin _$SpecializationAndCountry {
  @JsonKey(name: 'countries')
  List<Country?>? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'specializations')
  List<Specialization?>? get specialization =>
      throw _privateConstructorUsedError;

  /// Serializes this SpecializationAndCountry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecializationAndCountry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecializationAndCountryCopyWith<SpecializationAndCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecializationAndCountryCopyWith<$Res> {
  factory $SpecializationAndCountryCopyWith(SpecializationAndCountry value,
          $Res Function(SpecializationAndCountry) then) =
      _$SpecializationAndCountryCopyWithImpl<$Res, SpecializationAndCountry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'countries') List<Country?>? country,
      @JsonKey(name: 'specializations') List<Specialization?>? specialization});
}

/// @nodoc
class _$SpecializationAndCountryCopyWithImpl<$Res,
        $Val extends SpecializationAndCountry>
    implements $SpecializationAndCountryCopyWith<$Res> {
  _$SpecializationAndCountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecializationAndCountry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? specialization = freezed,
  }) {
    return _then(_value.copyWith(
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as List<Country?>?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as List<Specialization?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecializationAndCountryImplCopyWith<$Res>
    implements $SpecializationAndCountryCopyWith<$Res> {
  factory _$$SpecializationAndCountryImplCopyWith(
          _$SpecializationAndCountryImpl value,
          $Res Function(_$SpecializationAndCountryImpl) then) =
      __$$SpecializationAndCountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'countries') List<Country?>? country,
      @JsonKey(name: 'specializations') List<Specialization?>? specialization});
}

/// @nodoc
class __$$SpecializationAndCountryImplCopyWithImpl<$Res>
    extends _$SpecializationAndCountryCopyWithImpl<$Res,
        _$SpecializationAndCountryImpl>
    implements _$$SpecializationAndCountryImplCopyWith<$Res> {
  __$$SpecializationAndCountryImplCopyWithImpl(
      _$SpecializationAndCountryImpl _value,
      $Res Function(_$SpecializationAndCountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecializationAndCountry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = freezed,
    Object? specialization = freezed,
  }) {
    return _then(_$SpecializationAndCountryImpl(
      country: freezed == country
          ? _value._country
          : country // ignore: cast_nullable_to_non_nullable
              as List<Country?>?,
      specialization: freezed == specialization
          ? _value._specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as List<Specialization?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecializationAndCountryImpl implements _SpecializationAndCountry {
  const _$SpecializationAndCountryImpl(
      {@JsonKey(name: 'countries') final List<Country?>? country,
      @JsonKey(name: 'specializations')
      final List<Specialization?>? specialization})
      : _country = country,
        _specialization = specialization;

  factory _$SpecializationAndCountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecializationAndCountryImplFromJson(json);

  final List<Country?>? _country;
  @override
  @JsonKey(name: 'countries')
  List<Country?>? get country {
    final value = _country;
    if (value == null) return null;
    if (_country is EqualUnmodifiableListView) return _country;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Specialization?>? _specialization;
  @override
  @JsonKey(name: 'specializations')
  List<Specialization?>? get specialization {
    final value = _specialization;
    if (value == null) return null;
    if (_specialization is EqualUnmodifiableListView) return _specialization;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SpecializationAndCountry(country: $country, specialization: $specialization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecializationAndCountryImpl &&
            const DeepCollectionEquality().equals(other._country, _country) &&
            const DeepCollectionEquality()
                .equals(other._specialization, _specialization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_country),
      const DeepCollectionEquality().hash(_specialization));

  /// Create a copy of SpecializationAndCountry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecializationAndCountryImplCopyWith<_$SpecializationAndCountryImpl>
      get copyWith => __$$SpecializationAndCountryImplCopyWithImpl<
          _$SpecializationAndCountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecializationAndCountryImplToJson(
      this,
    );
  }
}

abstract class _SpecializationAndCountry implements SpecializationAndCountry {
  const factory _SpecializationAndCountry(
          {@JsonKey(name: 'countries') final List<Country?>? country,
          @JsonKey(name: 'specializations')
          final List<Specialization?>? specialization}) =
      _$SpecializationAndCountryImpl;

  factory _SpecializationAndCountry.fromJson(Map<String, dynamic> json) =
      _$SpecializationAndCountryImpl.fromJson;

  @override
  @JsonKey(name: 'countries')
  List<Country?>? get country;
  @override
  @JsonKey(name: 'specializations')
  List<Specialization?>? get specialization;

  /// Create a copy of SpecializationAndCountry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecializationAndCountryImplCopyWith<_$SpecializationAndCountryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$CountryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl extends _Country {
  _$CountryImpl({required this.id, required this.name}) : super._();

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country extends Country {
  factory _Country({required final int id, required final String name}) =
      _$CountryImpl;
  _Country._() : super._();

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Specialization _$SpecializationFromJson(Map<String, dynamic> json) {
  return _Specialization.fromJson(json);
}

/// @nodoc
mixin _$Specialization {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Specialization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Specialization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecializationCopyWith<Specialization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecializationCopyWith<$Res> {
  factory $SpecializationCopyWith(
          Specialization value, $Res Function(Specialization) then) =
      _$SpecializationCopyWithImpl<$Res, Specialization>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$SpecializationCopyWithImpl<$Res, $Val extends Specialization>
    implements $SpecializationCopyWith<$Res> {
  _$SpecializationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Specialization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecializationImplCopyWith<$Res>
    implements $SpecializationCopyWith<$Res> {
  factory _$$SpecializationImplCopyWith(_$SpecializationImpl value,
          $Res Function(_$SpecializationImpl) then) =
      __$$SpecializationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$SpecializationImplCopyWithImpl<$Res>
    extends _$SpecializationCopyWithImpl<$Res, _$SpecializationImpl>
    implements _$$SpecializationImplCopyWith<$Res> {
  __$$SpecializationImplCopyWithImpl(
      _$SpecializationImpl _value, $Res Function(_$SpecializationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Specialization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SpecializationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecializationImpl extends _Specialization {
  _$SpecializationImpl({required this.id, required this.name}) : super._();

  factory _$SpecializationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecializationImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of Specialization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecializationImplCopyWith<_$SpecializationImpl> get copyWith =>
      __$$SpecializationImplCopyWithImpl<_$SpecializationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecializationImplToJson(
      this,
    );
  }
}

abstract class _Specialization extends Specialization {
  factory _Specialization({required final int id, required final String name}) =
      _$SpecializationImpl;
  _Specialization._() : super._();

  factory _Specialization.fromJson(Map<String, dynamic> json) =
      _$SpecializationImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of Specialization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecializationImplCopyWith<_$SpecializationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get serial_numbe => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  int? get request_number => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  int get active => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? image,
      String? serial_numbe,
      String? description,
      Category? category,
      int? request_number,
      String price,
      int active,
      int? quantity});

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? serial_numbe = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? request_number = freezed,
    Object? price = null,
    Object? active = null,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      serial_numbe: freezed == serial_numbe
          ? _value.serial_numbe
          : serial_numbe // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      request_number: freezed == request_number
          ? _value.request_number
          : request_number // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? image,
      String? serial_numbe,
      String? description,
      Category? category,
      int? request_number,
      String price,
      int active,
      int? quantity});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? serial_numbe = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? request_number = freezed,
    Object? price = null,
    Object? active = null,
    Object? quantity = freezed,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      serial_numbe: freezed == serial_numbe
          ? _value.serial_numbe
          : serial_numbe // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      request_number: freezed == request_number
          ? _value.request_number
          : request_number // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.id,
      required this.name,
      this.image,
      this.serial_numbe,
      this.description,
      this.category,
      this.request_number,
      required this.price,
      required this.active,
      this.quantity});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? image;
  @override
  final String? serial_numbe;
  @override
  final String? description;
  @override
  final Category? category;
  @override
  final int? request_number;
  @override
  final String price;
  @override
  final int active;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, serial_numbe: $serial_numbe, description: $description, category: $category, request_number: $request_number, price: $price, active: $active, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.serial_numbe, serial_numbe) ||
                other.serial_numbe == serial_numbe) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.request_number, request_number) ||
                other.request_number == request_number) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, serial_numbe,
      description, category, request_number, price, active, quantity);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final int id,
      required final String name,
      final String? image,
      final String? serial_numbe,
      final String? description,
      final Category? category,
      final int? request_number,
      required final String price,
      required final int active,
      final int? quantity}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get image;
  @override
  String? get serial_numbe;
  @override
  String? get description;
  @override
  Category? get category;
  @override
  int? get request_number;
  @override
  String get price;
  @override
  int get active;
  @override
  int? get quantity;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyOrder _$MyOrderFromJson(Map<String, dynamic> json) {
  return _MyOrder.fromJson(json);
}

/// @nodoc
mixin _$MyOrder {
  int get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get serial_number => throw _privateConstructorUsedError;
  String? get delivery_time => throw _privateConstructorUsedError;
  String? get total_price => throw _privateConstructorUsedError;
  List<Product>? get products => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;

  /// Serializes this MyOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyOrderCopyWith<MyOrder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderCopyWith<$Res> {
  factory $MyOrderCopyWith(MyOrder value, $Res Function(MyOrder) then) =
      _$MyOrderCopyWithImpl<$Res, MyOrder>;
  @useResult
  $Res call(
      {int id,
      String? status,
      String? serial_number,
      String? delivery_time,
      String? total_price,
      List<Product>? products,
      DateTime? created_at});
}

/// @nodoc
class _$MyOrderCopyWithImpl<$Res, $Val extends MyOrder>
    implements $MyOrderCopyWith<$Res> {
  _$MyOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? serial_number = freezed,
    Object? delivery_time = freezed,
    Object? total_price = freezed,
    Object? products = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      serial_number: freezed == serial_number
          ? _value.serial_number
          : serial_number // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_time: freezed == delivery_time
          ? _value.delivery_time
          : delivery_time // ignore: cast_nullable_to_non_nullable
              as String?,
      total_price: freezed == total_price
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyOrderImplCopyWith<$Res> implements $MyOrderCopyWith<$Res> {
  factory _$$MyOrderImplCopyWith(
          _$MyOrderImpl value, $Res Function(_$MyOrderImpl) then) =
      __$$MyOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? status,
      String? serial_number,
      String? delivery_time,
      String? total_price,
      List<Product>? products,
      DateTime? created_at});
}

/// @nodoc
class __$$MyOrderImplCopyWithImpl<$Res>
    extends _$MyOrderCopyWithImpl<$Res, _$MyOrderImpl>
    implements _$$MyOrderImplCopyWith<$Res> {
  __$$MyOrderImplCopyWithImpl(
      _$MyOrderImpl _value, $Res Function(_$MyOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? serial_number = freezed,
    Object? delivery_time = freezed,
    Object? total_price = freezed,
    Object? products = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_$MyOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      serial_number: freezed == serial_number
          ? _value.serial_number
          : serial_number // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_time: freezed == delivery_time
          ? _value.delivery_time
          : delivery_time // ignore: cast_nullable_to_non_nullable
              as String?,
      total_price: freezed == total_price
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyOrderImpl implements _MyOrder {
  const _$MyOrderImpl(
      {required this.id,
      this.status,
      this.serial_number,
      this.delivery_time,
      this.total_price,
      final List<Product>? products,
      this.created_at})
      : _products = products;

  factory _$MyOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyOrderImplFromJson(json);

  @override
  final int id;
  @override
  final String? status;
  @override
  final String? serial_number;
  @override
  final String? delivery_time;
  @override
  final String? total_price;
  final List<Product>? _products;
  @override
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? created_at;

  @override
  String toString() {
    return 'MyOrder(id: $id, status: $status, serial_number: $serial_number, delivery_time: $delivery_time, total_price: $total_price, products: $products, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serial_number, serial_number) ||
                other.serial_number == serial_number) &&
            (identical(other.delivery_time, delivery_time) ||
                other.delivery_time == delivery_time) &&
            (identical(other.total_price, total_price) ||
                other.total_price == total_price) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      serial_number,
      delivery_time,
      total_price,
      const DeepCollectionEquality().hash(_products),
      created_at);

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrderImplCopyWith<_$MyOrderImpl> get copyWith =>
      __$$MyOrderImplCopyWithImpl<_$MyOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyOrderImplToJson(
      this,
    );
  }
}

abstract class _MyOrder implements MyOrder {
  const factory _MyOrder(
      {required final int id,
      final String? status,
      final String? serial_number,
      final String? delivery_time,
      final String? total_price,
      final List<Product>? products,
      final DateTime? created_at}) = _$MyOrderImpl;

  factory _MyOrder.fromJson(Map<String, dynamic> json) = _$MyOrderImpl.fromJson;

  @override
  int get id;
  @override
  String? get status;
  @override
  String? get serial_number;
  @override
  String? get delivery_time;
  @override
  String? get total_price;
  @override
  List<Product>? get products;
  @override
  DateTime? get created_at;

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyOrderImplCopyWith<_$MyOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({Product product, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, int quantity});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$CartItemImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl extends _CartItem {
  const _$CartItemImpl({required this.product, required this.quantity})
      : super._();

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final Product product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartItem(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem extends CartItem {
  const factory _CartItem(
      {required final Product product,
      required final int quantity}) = _$CartItemImpl;
  const _CartItem._() : super._();

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  Product get product;
  @override
  int get quantity;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
