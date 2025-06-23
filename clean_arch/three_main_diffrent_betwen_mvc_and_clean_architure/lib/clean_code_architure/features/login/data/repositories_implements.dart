import '../domain/login_entities.dart';
import '../domain/repositories_abstract.dart';
import 'login_sources.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final model = await remoteDataSource.login(email: email, password: password);
    if (model.status == true && model.user != null) {
      return model.user!;
    } else {
      throw Exception(model.message ?? "Login failed");
    }
  }
}
