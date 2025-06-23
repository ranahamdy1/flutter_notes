import 'package:flutter/material.dart';
import 'clean_code_architure/core/cache_helper.dart';
import 'clean_code_architure/core/dio_helper.dart';
import 'clean_code_architure/features/login/presentation/view/login_screen.dart';
import 'di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
