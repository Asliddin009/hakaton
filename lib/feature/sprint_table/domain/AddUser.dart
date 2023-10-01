
import 'package:dio/dio.dart';
import 'package:hakaton/app/data/shared_preferences/shared_preferences_storag.dart';

import '../../../app/data/global_const.dart';


final dio = Dio();

Future addUser(String name, int master, int sp) async {
  final token = await PreferencesStorage.getAuthToken();
  final response = await dio.post('$APP_URL/api/v1/add_user_to_project/',
      data: {"username": name,
            "profession": "prog",
            "master": master,
            "story_point": sp},
      options: Options(headers: {"Authorization": token}));

  return response.data;
}