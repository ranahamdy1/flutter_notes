import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../mvc/core/app_string.dart';
import '../../../../../../mvc/core/cache_helper.dart';
import '../../../domain/use_cases.dart';
import 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit(this.loginUseCase) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(email: email, password: password);
      await CacheHelper.saveData(key: AppStrings.token, value: user.token);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
