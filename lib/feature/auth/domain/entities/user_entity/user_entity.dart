import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String username,
    required String id,
    String? accessToken,
    String? refreshToken,
    @JsonKey(ignore: true) AsyncSnapshot? userState,
  }) = _UserEntity;
}
