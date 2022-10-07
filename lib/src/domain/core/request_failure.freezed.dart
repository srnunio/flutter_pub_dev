// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RequestFailureTearOff {
  const _$RequestFailureTearOff();

  _NetworkFailure networkError() {
    return _NetworkFailure();
  }

  _Empty empty() {
    return _Empty();
  }

  _ServerError serverError() {
    return _ServerError();
  }
}

/// @nodoc
const $RequestFailure = _$RequestFailureTearOff();

/// @nodoc
mixin _$RequestFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function() empty,
    required TResult Function() serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function()? empty,
    TResult Function()? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkFailure value) networkError,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ServerError value) serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkFailure value)? networkError,
    TResult Function(_Empty value)? empty,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFailureCopyWith<$Res> {
  factory $RequestFailureCopyWith(
          RequestFailure value, $Res Function(RequestFailure) then) =
      _$RequestFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestFailureCopyWithImpl<$Res>
    implements $RequestFailureCopyWith<$Res> {
  _$RequestFailureCopyWithImpl(this._value, this._then);

  final RequestFailure _value;
  // ignore: unused_field
  final $Res Function(RequestFailure) _then;
}

/// @nodoc
abstract class _$NetworkFailureCopyWith<$Res> {
  factory _$NetworkFailureCopyWith(
          _NetworkFailure value, $Res Function(_NetworkFailure) then) =
      __$NetworkFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$NetworkFailureCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res>
    implements _$NetworkFailureCopyWith<$Res> {
  __$NetworkFailureCopyWithImpl(
      _NetworkFailure _value, $Res Function(_NetworkFailure) _then)
      : super(_value, (v) => _then(v as _NetworkFailure));

  @override
  _NetworkFailure get _value => super._value as _NetworkFailure;
}

/// @nodoc

class _$_NetworkFailure implements _NetworkFailure {
  _$_NetworkFailure();

  @override
  String toString() {
    return 'RequestFailure.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NetworkFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function() empty,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function()? empty,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkFailure value) networkError,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkFailure value)? networkError,
    TResult Function(_Empty value)? empty,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkFailure implements RequestFailure {
  factory _NetworkFailure() = _$_NetworkFailure;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$RequestFailureCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  _$_Empty();

  @override
  String toString() {
    return 'RequestFailure.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function() empty,
    required TResult Function() serverError,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function()? empty,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkFailure value) networkError,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ServerError value) serverError,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkFailure value)? networkError,
    TResult Function(_Empty value)? empty,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements RequestFailure {
  factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;
}

/// @nodoc

class _$_ServerError implements _ServerError {
  _$_ServerError();

  @override
  String toString() {
    return 'RequestFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function() empty,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function()? empty,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkFailure value) networkError,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkFailure value)? networkError,
    TResult Function(_Empty value)? empty,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements RequestFailure {
  factory _ServerError() = _$_ServerError;
}
