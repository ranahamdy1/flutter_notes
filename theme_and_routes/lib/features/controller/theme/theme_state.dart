part of 'theme_cubit.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChangeState extends ThemeState {
  final ThemeMode themeMode;

  ThemeChangeState(this.themeMode);
}
