import 'package:clean_code/clean_code_architure/features/login/domain/repositories_abstract.dart';
import 'login_entities.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<UserEntity> call({required String email, required String password,}) {
    return repository.login(email: email, password: password);
  }
}
