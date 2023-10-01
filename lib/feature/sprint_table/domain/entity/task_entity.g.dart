// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskEntity _$$_TaskEntityFromJson(Map<String, dynamic> json) =>
    _$_TaskEntity(
      title: json['title'] as String,
      priority: json['priority'] as int,
      tag: json['tag'] as String,
      master: json['master'] as String?,
      story_point: json['story_point'] as int,
    );

Map<String, dynamic> _$$_TaskEntityToJson(_$_TaskEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'priority': instance.priority,
      'tag': instance.tag,
      'master': instance.master,
      'story_point': instance.story_point,
    };
