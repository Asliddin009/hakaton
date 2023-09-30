import 'package:hakaton/app/domain/app_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../domain/app_config.dart';
import 'auth_interceptor.dart';

@Singleton(as: AppApi)
class DioAppApi implements AppApi {
  late final Dio dio;

  DioAppApi(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
      headers: {"Content-Type": "application/json",
      'Server':'WSGIServer/0.2 CPython/3.11.3',
      'Content-Length':'<calculated when request is sent>'},
    );
    dio = Dio(options);
    if (kDebugMode) dio.interceptors.add(PrettyDioLogger());
    //dio.interceptors.add(AuthInterceptor());
  }

  @override
  Future<Response> getProfile() {
    try {
      return dio.get("/auth/user");
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> passwordUpdate(
      {required String oldPassword, required String newPassword}) {
    return dio.put("/auth/user", queryParameters: {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    });
  }

  @override
  Future<Response> refreshToken({String? refreshToken}) {
    try {
      return dio.post("/auth/token/$refreshToken");
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signIn(
      {required String password, required String username}) async {
    try {
      final response = await dio.post("auth/token/login/",
          data:  FormData.fromMap({"username": "admin", "password": "123"}),options: Options(headers: {"Content-Type": "application/json",
            'Server':'WSGIServer/0.2 CPython/3.11.3',
            'Content-Length':'<calculated when request is sent>'}));
      print(response);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signUp(
      {required String password,
      required String username}) {
    try {
      return dio.put("/auth/token", data: {
        "username": username,
        "password": password,
      });
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> userUpdate({String? username, String? email}) {
    return dio.post("/auth/user", data: {
      "username": username,
      "email": email,
    });
  }

  @override
  Future request(String path) {
    try {
      return dio.request(path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future fetch(RequestOptions requestOptions) {
    return dio.fetch(requestOptions);
  }

  @override
  Future fetchPosts(int fetchLimit, int offset) {
    return dio.get("/data/posts",
        queryParameters: {'fetchLimit': fetchLimit, 'offset': offset});
  }

  @override
  Future createPost(Map args) {
    return dio.post("/data/posts",
        data: {"name": args["name"], "content": args["content"]});
  }

  @override
  Future fetchPost(String id) {
    return dio.get("/data/posts/$id");
  }

  @override
  Future deletePost(String id) {
    return dio.delete("/data/posts/$id");
  }
}
