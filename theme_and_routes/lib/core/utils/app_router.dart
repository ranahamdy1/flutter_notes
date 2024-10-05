import 'package:go_router/go_router.dart';
import 'package:try_all/features/screens/home_screen.dart';
import 'package:try_all/features/screens/second_screen.dart';
import 'package:try_all/features/screens/third_screen.dart';

abstract class AppRouter {
  static const kSecondScreen = '/secondScreen';
  static const kThirdScreen= '/thirdScreen';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context,state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/secondScreen',
        builder: (context,state) => const SecondScreen(),
      ),
      GoRoute(
        path: '/thirdScreen',
        builder: (context,state) => const ThirdScreen(),
      ),
    ],
  );
}