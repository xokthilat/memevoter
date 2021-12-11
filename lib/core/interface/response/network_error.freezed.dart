// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NetworkErrorTearOff {
  const _$NetworkErrorTearOff();

  _ResponseError request({required DioError error}) {
    return _ResponseError(
      error: error,
    );
  }

  _DecodingError type({String? error}) {
    return _DecodingError(
      error: error,
    );
  }

  _Connectivity connectivity({String? message}) {
    return _Connectivity(
      message: message,
    );
  }

  _ImgFlipInternal imgflipInternal({String? message}) {
    return _ImgFlipInternal(
      message: message,
    );
  }

  _VoteError voteError({String? message}) {
    return _VoteError(
      message: message,
    );
  }
}

/// @nodoc
const $NetworkError = _$NetworkErrorTearOff();

/// @nodoc
mixin _$NetworkError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioError error) request,
    required TResult Function(String? error) type,
    required TResult Function(String? message) connectivity,
    required TResult Function(String? message) imgflipInternal,
    required TResult Function(String? message) voteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_ImgFlipInternal value) imgflipInternal,
    required TResult Function(_VoteError value) voteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res> implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._value, this._then);

  final NetworkError _value;
  // ignore: unused_field
  final $Res Function(NetworkError) _then;
}

/// @nodoc
abstract class _$ResponseErrorCopyWith<$Res> {
  factory _$ResponseErrorCopyWith(
          _ResponseError value, $Res Function(_ResponseError) then) =
      __$ResponseErrorCopyWithImpl<$Res>;
  $Res call({DioError error});
}

/// @nodoc
class __$ResponseErrorCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$ResponseErrorCopyWith<$Res> {
  __$ResponseErrorCopyWithImpl(
      _ResponseError _value, $Res Function(_ResponseError) _then)
      : super(_value, (v) => _then(v as _ResponseError));

  @override
  _ResponseError get _value => super._value as _ResponseError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_ResponseError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as DioError,
    ));
  }
}

/// @nodoc

class _$_ResponseError extends _ResponseError {
  const _$_ResponseError({required this.error}) : super._();

  @override
  final DioError error;

  @override
  String toString() {
    return 'NetworkError.request(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  _$ResponseErrorCopyWith<_ResponseError> get copyWith =>
      __$ResponseErrorCopyWithImpl<_ResponseError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioError error) request,
    required TResult Function(String? error) type,
    required TResult Function(String? message) connectivity,
    required TResult Function(String? message) imgflipInternal,
    required TResult Function(String? message) voteError,
  }) {
    return request(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
  }) {
    return request?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_ImgFlipInternal value) imgflipInternal,
    required TResult Function(_VoteError value) voteError,
  }) {
    return request(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
  }) {
    return request?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(this);
    }
    return orElse();
  }
}

abstract class _ResponseError extends NetworkError {
  const factory _ResponseError({required DioError error}) = _$_ResponseError;
  const _ResponseError._() : super._();

  DioError get error;
  @JsonKey(ignore: true)
  _$ResponseErrorCopyWith<_ResponseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DecodingErrorCopyWith<$Res> {
  factory _$DecodingErrorCopyWith(
          _DecodingError value, $Res Function(_DecodingError) then) =
      __$DecodingErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$DecodingErrorCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$DecodingErrorCopyWith<$Res> {
  __$DecodingErrorCopyWithImpl(
      _DecodingError _value, $Res Function(_DecodingError) _then)
      : super(_value, (v) => _then(v as _DecodingError));

  @override
  _DecodingError get _value => super._value as _DecodingError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_DecodingError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DecodingError extends _DecodingError {
  const _$_DecodingError({this.error}) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'NetworkError.type(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DecodingError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  _$DecodingErrorCopyWith<_DecodingError> get copyWith =>
      __$DecodingErrorCopyWithImpl<_DecodingError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioError error) request,
    required TResult Function(String? error) type,
    required TResult Function(String? message) connectivity,
    required TResult Function(String? message) imgflipInternal,
    required TResult Function(String? message) voteError,
  }) {
    return type(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
  }) {
    return type?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_ImgFlipInternal value) imgflipInternal,
    required TResult Function(_VoteError value) voteError,
  }) {
    return type(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
  }) {
    return type?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this);
    }
    return orElse();
  }
}

abstract class _DecodingError extends NetworkError {
  const factory _DecodingError({String? error}) = _$_DecodingError;
  const _DecodingError._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$DecodingErrorCopyWith<_DecodingError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ConnectivityCopyWith<$Res> {
  factory _$ConnectivityCopyWith(
          _Connectivity value, $Res Function(_Connectivity) then) =
      __$ConnectivityCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$ConnectivityCopyWithImpl<$Res> extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$ConnectivityCopyWith<$Res> {
  __$ConnectivityCopyWithImpl(
      _Connectivity _value, $Res Function(_Connectivity) _then)
      : super(_value, (v) => _then(v as _Connectivity));

  @override
  _Connectivity get _value => super._value as _Connectivity;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Connectivity(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Connectivity extends _Connectivity {
  const _$_Connectivity({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'NetworkError.connectivity(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Connectivity &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  _$ConnectivityCopyWith<_Connectivity> get copyWith =>
      __$ConnectivityCopyWithImpl<_Connectivity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioError error) request,
    required TResult Function(String? error) type,
    required TResult Function(String? message) connectivity,
    required TResult Function(String? message) imgflipInternal,
    required TResult Function(String? message) voteError,
  }) {
    return connectivity(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
  }) {
    return connectivity?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_ImgFlipInternal value) imgflipInternal,
    required TResult Function(_VoteError value) voteError,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class _Connectivity extends NetworkError {
  const factory _Connectivity({String? message}) = _$_Connectivity;
  const _Connectivity._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$ConnectivityCopyWith<_Connectivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ImgFlipInternalCopyWith<$Res> {
  factory _$ImgFlipInternalCopyWith(
          _ImgFlipInternal value, $Res Function(_ImgFlipInternal) then) =
      __$ImgFlipInternalCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$ImgFlipInternalCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$ImgFlipInternalCopyWith<$Res> {
  __$ImgFlipInternalCopyWithImpl(
      _ImgFlipInternal _value, $Res Function(_ImgFlipInternal) _then)
      : super(_value, (v) => _then(v as _ImgFlipInternal));

  @override
  _ImgFlipInternal get _value => super._value as _ImgFlipInternal;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ImgFlipInternal(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ImgFlipInternal extends _ImgFlipInternal {
  const _$_ImgFlipInternal({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'NetworkError.imgflipInternal(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImgFlipInternal &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  _$ImgFlipInternalCopyWith<_ImgFlipInternal> get copyWith =>
      __$ImgFlipInternalCopyWithImpl<_ImgFlipInternal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioError error) request,
    required TResult Function(String? error) type,
    required TResult Function(String? message) connectivity,
    required TResult Function(String? message) imgflipInternal,
    required TResult Function(String? message) voteError,
  }) {
    return imgflipInternal(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
  }) {
    return imgflipInternal?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
    required TResult orElse(),
  }) {
    if (imgflipInternal != null) {
      return imgflipInternal(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_ImgFlipInternal value) imgflipInternal,
    required TResult Function(_VoteError value) voteError,
  }) {
    return imgflipInternal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
  }) {
    return imgflipInternal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
    required TResult orElse(),
  }) {
    if (imgflipInternal != null) {
      return imgflipInternal(this);
    }
    return orElse();
  }
}

abstract class _ImgFlipInternal extends NetworkError {
  const factory _ImgFlipInternal({String? message}) = _$_ImgFlipInternal;
  const _ImgFlipInternal._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$ImgFlipInternalCopyWith<_ImgFlipInternal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VoteErrorCopyWith<$Res> {
  factory _$VoteErrorCopyWith(
          _VoteError value, $Res Function(_VoteError) then) =
      __$VoteErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$VoteErrorCopyWithImpl<$Res> extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$VoteErrorCopyWith<$Res> {
  __$VoteErrorCopyWithImpl(_VoteError _value, $Res Function(_VoteError) _then)
      : super(_value, (v) => _then(v as _VoteError));

  @override
  _VoteError get _value => super._value as _VoteError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_VoteError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_VoteError extends _VoteError {
  const _$_VoteError({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'NetworkError.voteError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VoteError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  _$VoteErrorCopyWith<_VoteError> get copyWith =>
      __$VoteErrorCopyWithImpl<_VoteError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioError error) request,
    required TResult Function(String? error) type,
    required TResult Function(String? message) connectivity,
    required TResult Function(String? message) imgflipInternal,
    required TResult Function(String? message) voteError,
  }) {
    return voteError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
  }) {
    return voteError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioError error)? request,
    TResult Function(String? error)? type,
    TResult Function(String? message)? connectivity,
    TResult Function(String? message)? imgflipInternal,
    TResult Function(String? message)? voteError,
    required TResult orElse(),
  }) {
    if (voteError != null) {
      return voteError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseError value) request,
    required TResult Function(_DecodingError value) type,
    required TResult Function(_Connectivity value) connectivity,
    required TResult Function(_ImgFlipInternal value) imgflipInternal,
    required TResult Function(_VoteError value) voteError,
  }) {
    return voteError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
  }) {
    return voteError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseError value)? request,
    TResult Function(_DecodingError value)? type,
    TResult Function(_Connectivity value)? connectivity,
    TResult Function(_ImgFlipInternal value)? imgflipInternal,
    TResult Function(_VoteError value)? voteError,
    required TResult orElse(),
  }) {
    if (voteError != null) {
      return voteError(this);
    }
    return orElse();
  }
}

abstract class _VoteError extends NetworkError {
  const factory _VoteError({String? message}) = _$_VoteError;
  const _VoteError._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$VoteErrorCopyWith<_VoteError> get copyWith =>
      throw _privateConstructorUsedError;
}
