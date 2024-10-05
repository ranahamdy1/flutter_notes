import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_all/features/controller/theme/theme_cubit.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.dark; // Default theme
          if (state is ThemeChangeState) {
            themeMode = state.themeMode;
          }
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeMode, // This sets the theme globally/ for dark mode
              routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
