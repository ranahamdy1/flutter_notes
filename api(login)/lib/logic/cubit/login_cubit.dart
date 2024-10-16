import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/api(login)/logic/app_string.dart';
import 'package:flutter_notes/api(login)/logic/cache_helper.dart';
import 'package:flutter_notes/api(login)/logic/dio_helper.dart';
import 'package:flutter_notes/api(login)/logic/end_points.dart';
import 'package:flutter_notes/api(login)/logic/login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: Endpoints.login, data: {
      "email": email,
      "password": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('${loginModel.message}');
      if (loginModel.status == true) {  // Use == for comparison
        CacheHelper.saveData(
            key: AppStrings.token, value: loginModel.data?.token ?? '');
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState(msg: loginModel.message ?? ''));
      }
    }).catchError((onError) {
      emit(LoginFailedState(msg: onError.toString()));
      print(onError);
    });
  }
}
