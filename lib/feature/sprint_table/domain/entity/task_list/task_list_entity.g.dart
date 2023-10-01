// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskListEntity _$$_TaskListEntityFromJson(Map<String, dynamic> json) =>
    _$_TaskListEntity(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaskListEntityToJson(_$_TaskListEntity instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
