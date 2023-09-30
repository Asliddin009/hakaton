// /*
// import 'package:hakaton/app/domain/app_api.dart';
// import 'package:hakaton/feature/auth/domain/auth_state/auth_cubit.dart';
// import 'package:dio/dio.dart';
//
// import '../domain/di/init_di.dart';
//
// class AuthInterceptor extends QueuedInterceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final accessToken = locator.get<AuthCubit>().state.whenOrNull(
//           authorized: (userEntity) => userEntity.accessToken,
//         );
//     if (accessToken == null) {
//       super.onRequest(options, handler);
//     } else {
//       final headers = options.headers;
//       headers["Content-Type"] = "application/json";
//       headers["Authorization"] = "Bearer $accessToken";
//       super.onRequest(options.copyWith(headers: headers), handler);
//     }
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       try {
//         //await locator.get<AuthCubit>().refreshToken();
//         final request = await locator.get<AppApi>().fetch(err.requestOptions);
//         return handler.resolve(request);
//       } catch (_) {
//         super.onError(err, handler);
//       }
//     } else {
//       super.onError(err, handler);
//     }
//   }
// }
// */
