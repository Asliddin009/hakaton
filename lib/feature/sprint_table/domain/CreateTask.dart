import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hakaton/app/data/shared_preferences/shared_preferences_storag.dart';
import 'package:hakaton/feature/sprint_table/domain/entity/task_entity.dart';
import 'package:hakaton/feature/sprint_table/domain/entity/task_list/task_list_entity.dart';

import '../../../app/data/global_const.dart';

final dio = Dio();

Future<Response> CreateTask(List<TaskEntity> list) async {
  final token = await PreferencesStorage.getAuthToken();
  TaskListEntity tasksList=TaskListEntity(tasks: list);
  print(tasksList.toJson());


  /*String tasks = '{"":[';
  for (int i = 0; i < list.length; i++) {
    tasks += list[i].toJson().toString();
  }
  tasks += ']}';
  print(tasks);*/
  final response = await dio.post('$APP_URL/api/v1/create_tasks/',
      data: tasksList.toJson(),
      options: Options(headers: {"Authorization": token}));
  return response;
}
