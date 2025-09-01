// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) navigateToTab,
    required TResult Function() resetState,
    required TResult Function(
            String title, String message, String senderName, String senderEmail)
        sendSupport,
    required TResult Function(Map<String, dynamic> orderData) addOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? navigateToTab,
    TResult? Function()? resetState,
    TResult? Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult? Function(Map<String, dynamic> orderData)? addOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? navigateToTab,
    TResult Function()? resetState,
    TResult Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult Function(Map<String, dynamic> orderData)? addOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateToTab value) navigateToTab,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_AddOrder value) addOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigateToTab value)? navigateToTab,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_AddOrder value)? addOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateToTab value)? navigateToTab,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_AddOrder value)? addOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageEventCopyWith<$Res> {
  factory $MainPageEventCopyWith(
          MainPageEvent value, $Res Function(MainPageEvent) then) =
      _$MainPageEventCopyWithImpl<$Res, MainPageEvent>;
}

/// @nodoc
class _$MainPageEventCopyWithImpl<$Res, $Val extends MainPageEvent>
    implements $MainPageEventCopyWith<$Res> {
  _$MainPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NavigateToTabImplCopyWith<$Res> {
  factory _$$NavigateToTabImplCopyWith(
          _$NavigateToTabImpl value, $Res Function(_$NavigateToTabImpl) then) =
      __$$NavigateToTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$NavigateToTabImplCopyWithImpl<$Res>
    extends _$MainPageEventCopyWithImpl<$Res, _$NavigateToTabImpl>
    implements _$$NavigateToTabImplCopyWith<$Res> {
  __$$NavigateToTabImplCopyWithImpl(
      _$NavigateToTabImpl _value, $Res Function(_$NavigateToTabImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$NavigateToTabImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NavigateToTabImpl implements NavigateToTab {
  const _$NavigateToTabImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'MainPageEvent.navigateToTab(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToTabImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigateToTabImplCopyWith<_$NavigateToTabImpl> get copyWith =>
      __$$NavigateToTabImplCopyWithImpl<_$NavigateToTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) navigateToTab,
    required TResult Function() resetState,
    required TResult Function(
            String title, String message, String senderName, String senderEmail)
        sendSupport,
    required TResult Function(Map<String, dynamic> orderData) addOrder,
  }) {
    return navigateToTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? navigateToTab,
    TResult? Function()? resetState,
    TResult? Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult? Function(Map<String, dynamic> orderData)? addOrder,
  }) {
    return navigateToTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? navigateToTab,
    TResult Function()? resetState,
    TResult Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult Function(Map<String, dynamic> orderData)? addOrder,
    required TResult orElse(),
  }) {
    if (navigateToTab != null) {
      return navigateToTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateToTab value) navigateToTab,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_AddOrder value) addOrder,
  }) {
    return navigateToTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigateToTab value)? navigateToTab,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_AddOrder value)? addOrder,
  }) {
    return navigateToTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateToTab value)? navigateToTab,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_AddOrder value)? addOrder,
    required TResult orElse(),
  }) {
    if (navigateToTab != null) {
      return navigateToTab(this);
    }
    return orElse();
  }
}

abstract class NavigateToTab implements MainPageEvent {
  const factory NavigateToTab(final int index) = _$NavigateToTabImpl;

  int get index;

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigateToTabImplCopyWith<_$NavigateToTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetStateImplCopyWith<$Res> {
  factory _$$ResetStateImplCopyWith(
          _$ResetStateImpl value, $Res Function(_$ResetStateImpl) then) =
      __$$ResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetStateImplCopyWithImpl<$Res>
    extends _$MainPageEventCopyWithImpl<$Res, _$ResetStateImpl>
    implements _$$ResetStateImplCopyWith<$Res> {
  __$$ResetStateImplCopyWithImpl(
      _$ResetStateImpl _value, $Res Function(_$ResetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetStateImpl implements _ResetState {
  const _$ResetStateImpl();

  @override
  String toString() {
    return 'MainPageEvent.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) navigateToTab,
    required TResult Function() resetState,
    required TResult Function(
            String title, String message, String senderName, String senderEmail)
        sendSupport,
    required TResult Function(Map<String, dynamic> orderData) addOrder,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? navigateToTab,
    TResult? Function()? resetState,
    TResult? Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult? Function(Map<String, dynamic> orderData)? addOrder,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? navigateToTab,
    TResult Function()? resetState,
    TResult Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult Function(Map<String, dynamic> orderData)? addOrder,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateToTab value) navigateToTab,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_AddOrder value) addOrder,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigateToTab value)? navigateToTab,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_AddOrder value)? addOrder,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateToTab value)? navigateToTab,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_AddOrder value)? addOrder,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements MainPageEvent {
  const factory _ResetState() = _$ResetStateImpl;
}

/// @nodoc
abstract class _$$SendSupportImplCopyWith<$Res> {
  factory _$$SendSupportImplCopyWith(
          _$SendSupportImpl value, $Res Function(_$SendSupportImpl) then) =
      __$$SendSupportImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title, String message, String senderName, String senderEmail});
}

/// @nodoc
class __$$SendSupportImplCopyWithImpl<$Res>
    extends _$MainPageEventCopyWithImpl<$Res, _$SendSupportImpl>
    implements _$$SendSupportImplCopyWith<$Res> {
  __$$SendSupportImplCopyWithImpl(
      _$SendSupportImpl _value, $Res Function(_$SendSupportImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? senderName = null,
    Object? senderEmail = null,
  }) {
    return _then(_$SendSupportImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderEmail: null == senderEmail
          ? _value.senderEmail
          : senderEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendSupportImpl implements _SendSupport {
  const _$SendSupportImpl(
      {required this.title,
      required this.message,
      required this.senderName,
      required this.senderEmail});

  @override
  final String title;
  @override
  final String message;
  @override
  final String senderName;
  @override
  final String senderEmail;

  @override
  String toString() {
    return 'MainPageEvent.sendSupport(title: $title, message: $message, senderName: $senderName, senderEmail: $senderEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSupportImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderEmail, senderEmail) ||
                other.senderEmail == senderEmail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, message, senderName, senderEmail);

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSupportImplCopyWith<_$SendSupportImpl> get copyWith =>
      __$$SendSupportImplCopyWithImpl<_$SendSupportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) navigateToTab,
    required TResult Function() resetState,
    required TResult Function(
            String title, String message, String senderName, String senderEmail)
        sendSupport,
    required TResult Function(Map<String, dynamic> orderData) addOrder,
  }) {
    return sendSupport(title, message, senderName, senderEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? navigateToTab,
    TResult? Function()? resetState,
    TResult? Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult? Function(Map<String, dynamic> orderData)? addOrder,
  }) {
    return sendSupport?.call(title, message, senderName, senderEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? navigateToTab,
    TResult Function()? resetState,
    TResult Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult Function(Map<String, dynamic> orderData)? addOrder,
    required TResult orElse(),
  }) {
    if (sendSupport != null) {
      return sendSupport(title, message, senderName, senderEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateToTab value) navigateToTab,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_AddOrder value) addOrder,
  }) {
    return sendSupport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigateToTab value)? navigateToTab,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_AddOrder value)? addOrder,
  }) {
    return sendSupport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateToTab value)? navigateToTab,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_AddOrder value)? addOrder,
    required TResult orElse(),
  }) {
    if (sendSupport != null) {
      return sendSupport(this);
    }
    return orElse();
  }
}

abstract class _SendSupport implements MainPageEvent {
  const factory _SendSupport(
      {required final String title,
      required final String message,
      required final String senderName,
      required final String senderEmail}) = _$SendSupportImpl;

  String get title;
  String get message;
  String get senderName;
  String get senderEmail;

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendSupportImplCopyWith<_$SendSupportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrderImplCopyWith<$Res> {
  factory _$$AddOrderImplCopyWith(
          _$AddOrderImpl value, $Res Function(_$AddOrderImpl) then) =
      __$$AddOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> orderData});
}

/// @nodoc
class __$$AddOrderImplCopyWithImpl<$Res>
    extends _$MainPageEventCopyWithImpl<$Res, _$AddOrderImpl>
    implements _$$AddOrderImplCopyWith<$Res> {
  __$$AddOrderImplCopyWithImpl(
      _$AddOrderImpl _value, $Res Function(_$AddOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderData = null,
  }) {
    return _then(_$AddOrderImpl(
      orderData: null == orderData
          ? _value._orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$AddOrderImpl implements _AddOrder {
  const _$AddOrderImpl({required final Map<String, dynamic> orderData})
      : _orderData = orderData;

  final Map<String, dynamic> _orderData;
  @override
  Map<String, dynamic> get orderData {
    if (_orderData is EqualUnmodifiableMapView) return _orderData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderData);
  }

  @override
  String toString() {
    return 'MainPageEvent.addOrder(orderData: $orderData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrderImpl &&
            const DeepCollectionEquality()
                .equals(other._orderData, _orderData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orderData));

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrderImplCopyWith<_$AddOrderImpl> get copyWith =>
      __$$AddOrderImplCopyWithImpl<_$AddOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) navigateToTab,
    required TResult Function() resetState,
    required TResult Function(
            String title, String message, String senderName, String senderEmail)
        sendSupport,
    required TResult Function(Map<String, dynamic> orderData) addOrder,
  }) {
    return addOrder(orderData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? navigateToTab,
    TResult? Function()? resetState,
    TResult? Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult? Function(Map<String, dynamic> orderData)? addOrder,
  }) {
    return addOrder?.call(orderData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? navigateToTab,
    TResult Function()? resetState,
    TResult Function(String title, String message, String senderName,
            String senderEmail)?
        sendSupport,
    TResult Function(Map<String, dynamic> orderData)? addOrder,
    required TResult orElse(),
  }) {
    if (addOrder != null) {
      return addOrder(orderData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigateToTab value) navigateToTab,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_SendSupport value) sendSupport,
    required TResult Function(_AddOrder value) addOrder,
  }) {
    return addOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavigateToTab value)? navigateToTab,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_SendSupport value)? sendSupport,
    TResult? Function(_AddOrder value)? addOrder,
  }) {
    return addOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigateToTab value)? navigateToTab,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_SendSupport value)? sendSupport,
    TResult Function(_AddOrder value)? addOrder,
    required TResult orElse(),
  }) {
    if (addOrder != null) {
      return addOrder(this);
    }
    return orElse();
  }
}

abstract class _AddOrder implements MainPageEvent {
  const factory _AddOrder({required final Map<String, dynamic> orderData}) =
      _$AddOrderImpl;

  Map<String, dynamic> get orderData;

  /// Create a copy of MainPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddOrderImplCopyWith<_$AddOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainPageState {
  int get selectedIndex => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainPageStateCopyWith<MainPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageStateCopyWith<$Res> {
  factory $MainPageStateCopyWith(
          MainPageState value, $Res Function(MainPageState) then) =
      _$MainPageStateCopyWithImpl<$Res, MainPageState>;
  @useResult
  $Res call(
      {int selectedIndex,
      String? errorMessage,
      String? successMessage,
      bool isLoading});
}

/// @nodoc
class _$MainPageStateCopyWithImpl<$Res, $Val extends MainPageState>
    implements $MainPageStateCopyWith<$Res> {
  _$MainPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainPageStateImplCopyWith<$Res>
    implements $MainPageStateCopyWith<$Res> {
  factory _$$MainPageStateImplCopyWith(
          _$MainPageStateImpl value, $Res Function(_$MainPageStateImpl) then) =
      __$$MainPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedIndex,
      String? errorMessage,
      String? successMessage,
      bool isLoading});
}

/// @nodoc
class __$$MainPageStateImplCopyWithImpl<$Res>
    extends _$MainPageStateCopyWithImpl<$Res, _$MainPageStateImpl>
    implements _$$MainPageStateImplCopyWith<$Res> {
  __$$MainPageStateImplCopyWithImpl(
      _$MainPageStateImpl _value, $Res Function(_$MainPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$MainPageStateImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MainPageStateImpl implements _MainPageState {
  const _$MainPageStateImpl(
      {this.selectedIndex = 0,
      this.errorMessage,
      this.successMessage,
      this.isLoading = false});

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'MainPageState(selectedIndex: $selectedIndex, errorMessage: $errorMessage, successMessage: $successMessage, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedIndex, errorMessage, successMessage, isLoading);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      __$$MainPageStateImplCopyWithImpl<_$MainPageStateImpl>(this, _$identity);
}

abstract class _MainPageState implements MainPageState {
  const factory _MainPageState(
      {final int selectedIndex,
      final String? errorMessage,
      final String? successMessage,
      final bool isLoading}) = _$MainPageStateImpl;

  @override
  int get selectedIndex;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  bool get isLoading;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
