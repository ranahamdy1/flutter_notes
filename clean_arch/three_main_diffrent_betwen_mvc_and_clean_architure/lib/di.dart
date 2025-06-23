import 'package:get_it/get_it.dart';
import 'clean_code_architure/features/login/data/login_sources.dart';
import 'clean_code_architure/features/login/data/repositories_implements.dart';
import 'clean_code_architure/features/login/domain/repositories_abstract.dart';
import 'clean_code_architure/features/login/domain/use_cases.dart';
import 'clean_code_architure/features/login/presentation/controller/cubit/login_cubit.dart';

final sl = GetIt.instance;
//      //create: (context) => AuthCubit(LoginUseCase(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),),
void init() {
  // Cubit
  sl.registerFactory(() => AuthCubit(sl())); // الكائن فيه حالة (State) وعايزه يتجدد كل مرة (registerFactory)

  // UseCase
  sl.registerLazySingleton(() => LoginUseCase(sl())); // الكائن بلا حالة وعايزه تعيد نفس النسخة دائمًا (registerLazySingleton)

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl()); //ما بيعتمدش على أي حاجة تانية (self-contained) علشان كده مافيش sl()
}
