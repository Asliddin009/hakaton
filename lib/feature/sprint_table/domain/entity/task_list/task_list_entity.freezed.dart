// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskListEntity _$TaskListEntityFromJson(Map<String, dynamic> json) {
  return _TaskListEntity.fromJson(json);
}

/// @nodoc
mixin _$TaskListEntity {
  List<TaskEntity> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskListEntityCopyWith<TaskListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListEntityCopyWith<$Res> {
  factory $TaskListEntityCopyWith(
          TaskListEntity value, $Res Function(TaskListEntity) then) =
      _$TaskListEntityCopyWithImpl<$Res, TaskListEntity>;
  @useResult
  $Res call({List<TaskEntity> tasks});
}

/// @nodoc
class _$TaskListEntityCopyWithImpl<$Res, $Val extends TaskListEntity>
    implements $TaskListEntityCopyWith<$Res> {
  _$TaskListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskListEntityCopyWith<$Res>
    implements $TaskListEntityCopyWith<$Res> {
  factory _$$_TaskListEntityCopyWith(
          _$_TaskListEntity value, $Res Function(_$_TaskListEntity) then) =
      __$$_TaskListEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TaskEntity> tasks});
}

/// @nodoc
class __$$_TaskListEntityCopyWithImpl<$Res>
    extends _$TaskListEntityCopyWithImpl<$Res, _$_TaskListEntity>
    implements _$$_TaskListEntityCopyWith<$Res> {
  __$$_TaskListEntityCopyWithImpl(
      _$_TaskListEntity _value, $Res Function(_$_TaskListEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$_TaskListEntity(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskListEntity implements _TaskListEntity {
  const _$_TaskListEntity({required final List<TaskEntity> tasks})
      : _tasks = tasks;

  factory _$_TaskListEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TaskListEntityFromJson(json);

  final List<TaskEntity> _tasks;
  @override
  List<TaskEntity> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskListEntity(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskListEntity &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskListEntityCopyWith<_$_TaskListEntity> get copyWith =>
      __$$_TaskListEntityCopyWithImpl<_$_TaskListEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskListEntityToJson(
      this,
    );
  }
}

abstract class _TaskListEntity implements TaskListEntity {
  const factory _TaskListEntity({required final List<TaskEntity> tasks}) =
      _$_TaskListEntity;

  factory _TaskListEntity.fromJson(Map<String, dynamic> json) =
      _$_TaskListEntity.fromJson;

  @override
  List<TaskEntity> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_TaskListEntityCopyWith<_$_TaskListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
