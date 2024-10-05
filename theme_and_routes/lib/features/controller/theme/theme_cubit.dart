import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  // Static method with type parameter for type safety
  static ThemeCubit get(BuildContext context) => BlocProvider.of<ThemeCubit>(context);

  // Managing theme mode directly
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  // Method to toggle theme mode
  void changeAppMode() {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    emit(ThemeChangeState(_themeMode));
  }
}
