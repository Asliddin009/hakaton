abstract class AuthRepository {

  Future<dynamic> signUp({
    required String username,
    required String password,
  });

  Future<dynamic> signIn({
    required String password,
    required String username,
  });

  Future<dynamic> getProfile(
      );

  Future<dynamic> userUpdate({
    String? username,

  });

  Future<dynamic> passwordUpdate({
    required String oldPassword,
    required String newPassword,
  });

  Future<dynamic> refreshToken({required String refreshToken});
}
