import 'package:freezed_annotation/freezed_annotation.dart';
part 'project_entity.freezed.dart';
part 'project_entity.g.dart';

@freezed
class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
    required String id,
    required String title,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);
}
