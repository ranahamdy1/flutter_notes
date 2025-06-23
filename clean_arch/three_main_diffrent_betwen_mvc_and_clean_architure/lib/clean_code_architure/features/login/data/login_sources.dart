import 'package:clean_code/clean_code_architure/features/login/data/login_model.dart';
import '../../../../mvc/core/dio_helper.dart';
import '../../../../mvc/core/end_points.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({required String email, required String password,});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginModel> login({required String email, required String password,}) async {
    final response = await DioHelper.postData(
      url: Endpoints.login,
      data: {'email': email, 'password': password},
    );
    return LoginModel.fromJson(response.data);
  }
}
