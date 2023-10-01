import 'package:freezed_annotation/freezed_annotation.dart';

import '../task_entity.dart';

part 'task_list_entity.freezed.dart';

part 'task_list_entity.g.dart';

@freezed
class TaskListEntity with _$TaskListEntity {
  const factory TaskListEntity(
      {required List<TaskEntity> tasks}) = _TaskListEntity;

  factory TaskListEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskListEntityFromJson(json);
}
