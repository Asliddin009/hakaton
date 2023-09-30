import 'package:hakaton/feature/auth/domain/auth_repository.dart';
import 'package:hakaton/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  @override
  Future getProfile() {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(
        username: "test",
        id: "-1",
      );
    });
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
  Future signIn({required String password, required String username}) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(
        username: username,
        id: "-1",
      );
    });
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
