
import 'login_entities.dart';

abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password,});
}
