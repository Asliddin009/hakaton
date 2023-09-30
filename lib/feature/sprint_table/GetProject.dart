import 'dart:convert';

import 'package:dio/dio.dart';

final dio = Dio();

Future getHttp() async {
  final response = await dio.get('http://10.241.1.152:8080/api/v1/tasks_in_sprint/11', options: Options(headers: {"Authorization": "token c85782eb6946a3266097eb90e7b770a41b16f1e7"}));

  return response.data;
}