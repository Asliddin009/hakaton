
import 'package:dio/dio.dart';
import 'package:hakaton/app/data/shared_preferences/shared_preferences_storag.dart';

import '../../app/data/global_const.dart';

final dio = Dio();

Future getHttp() async {
  final token = await PreferencesStorage.getAuthToken();
  final response = await dio.get('$APP_URL/api/v1/tasks_in_sprint/11', options: Options(headers: {"Authorization": token}));

  return response.data;
}