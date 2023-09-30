import 'package:hakaton/app/domain/app_api.dart';
import 'package:hakaton/feature/auth/domain/auth_repository.dart';
import 'package:hakaton/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
@prod
class NetAuthRepository implements AuthRepository {
  final AppApi api;
  NetAuthRepository(this.api);
  @override
  Future getProfile() async{
    try {
      final response = await api.getProfile();
      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future passwordUpdate(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future refreshToken({required String refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future signIn({required String password, required String username}) async{
    try {
      final response = await api.signIn(password: password,username: username);
      return response.data;
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future userUpdate({String? username, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }

  @override
  Future signUp({required String username, required String password}) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(
        username: username,
        id: "-1",
      );
    });

  }
}
