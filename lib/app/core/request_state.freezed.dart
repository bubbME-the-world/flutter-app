// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_data<T> value) success,
    required TResult Function(_error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_data<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_data<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<T, $Res> {
  factory $RequestStateCopyWith(
          RequestState<T> value, $Res Function(RequestState<T>) then) =
      _$RequestStateCopyWithImpl<T, $Res, RequestState<T>>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<T, $Res, $Val extends RequestState<T>>
    implements $RequestStateCopyWith<T, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$initialImplCopyWith<T, $Res> {
  factory _$$initialImplCopyWith(
          _$initialImpl<T> value, $Res Function(_$initialImpl<T>) then) =
      __$$initialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$initialImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$initialImpl<T>>
    implements _$$initialImplCopyWith<T, $Res> {
  __$$initialImplCopyWithImpl(
      _$initialImpl<T> _value, $Res Function(_$initialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialImpl<T> implements _initial<T> {
  const _$initialImpl();

  @override
  String toString() {
    return 'RequestState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_data<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_data<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_data<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial<T> implements RequestState<T> {
  const factory _initial() = _$initialImpl<T>;
}

/// @nodoc
abstract class _$$loadingImplCopyWith<T, $Res> {
  factory _$$loadingImplCopyWith(
          _$loadingImpl<T> value, $Res Function(_$loadingImpl<T>) then) =
      __$$loadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$loadingImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$loadingImpl<T>>
    implements _$$loadingImplCopyWith<T, $Res> {
  __$$loadingImplCopyWithImpl(
      _$loadingImpl<T> _value, $Res Function(_$loadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingImpl<T> implements _loading<T> {
  const _$loadingImpl();

  @override
  String toString() {
    return 'RequestState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_data<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_data<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_data<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading<T> implements RequestState<T> {
  const factory _loading() = _$loadingImpl<T>;
}

/// @nodoc
abstract class _$$dataImplCopyWith<T, $Res> {
  factory _$$dataImplCopyWith(
          _$dataImpl<T> value, $Res Function(_$dataImpl<T>) then) =
      __$$dataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$dataImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$dataImpl<T>>
    implements _$$dataImplCopyWith<T, $Res> {
  __$$dataImplCopyWithImpl(
      _$dataImpl<T> _value, $Res Function(_$dataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$dataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$dataImpl<T> implements _data<T> {
  const _$dataImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RequestState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$dataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$dataImplCopyWith<T, _$dataImpl<T>> get copyWith =>
      __$$dataImplCopyWithImpl<T, _$dataImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String? message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_data<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_data<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_data<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _data<T> implements RequestState<T> {
  const factory _data(final T data) = _$dataImpl<T>;

  T get data;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$dataImplCopyWith<T, _$dataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorImplCopyWith<T, $Res> {
  factory _$$errorImplCopyWith(
          _$errorImpl<T> value, $Res Function(_$errorImpl<T>) then) =
      __$$errorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$errorImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$errorImpl<T>>
    implements _$$errorImplCopyWith<T, $Res> {
  __$$errorImplCopyWithImpl(
      _$errorImpl<T> _value, $Res Function(_$errorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$errorImpl<T>(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$errorImpl<T> implements _error<T> {
  const _$errorImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'RequestState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$errorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$errorImplCopyWith<T, _$errorImpl<T>> get copyWith =>
      __$$errorImplCopyWithImpl<T, _$errorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_data<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_data<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_data<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error<T> implements RequestState<T> {
  const factory _error(final String? message) = _$errorImpl<T>;

  String? get message;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$errorImplCopyWith<T, _$errorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
