// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectEntity _$ProjectEntityFromJson(Map<String, dynamic> json) {
  return _ProjectEntity.fromJson(json);
}

/// @nodoc
mixin _$ProjectEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectEntityCopyWith<ProjectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEntityCopyWith<$Res> {
  factory $ProjectEntityCopyWith(
          ProjectEntity value, $Res Function(ProjectEntity) then) =
      _$ProjectEntityCopyWithImpl<$Res, ProjectEntity>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res, $Val extends ProjectEntity>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectEntityCopyWith<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  factory _$$_ProjectEntityCopyWith(
          _$_ProjectEntity value, $Res Function(_$_ProjectEntity) then) =
      __$$_ProjectEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_ProjectEntityCopyWithImpl<$Res>
    extends _$ProjectEntityCopyWithImpl<$Res, _$_ProjectEntity>
    implements _$$_ProjectEntityCopyWith<$Res> {
  __$$_ProjectEntityCopyWithImpl(
      _$_ProjectEntity _value, $Res Function(_$_ProjectEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_ProjectEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectEntity implements _ProjectEntity {
  const _$_ProjectEntity({required this.id, required this.title});

  factory _$_ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectEntityFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'ProjectEntity(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectEntityCopyWith<_$_ProjectEntity> get copyWith =>
      __$$_ProjectEntityCopyWithImpl<_$_ProjectEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectEntityToJson(
      this,
    );
  }
}

abstract class _ProjectEntity implements ProjectEntity {
  const factory _ProjectEntity(
      {required final String id,
      required final String title}) = _$_ProjectEntity;

  factory _ProjectEntity.fromJson(Map<String, dynamic> json) =
      _$_ProjectEntity.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectEntityCopyWith<_$_ProjectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
