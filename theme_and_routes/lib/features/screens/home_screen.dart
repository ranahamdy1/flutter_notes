import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:try_all/core/utils/app_router.dart';
import 'package:try_all/features/controller/theme/theme_cubit.dart';
import 'package:try_all/features/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = ThemeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeCubit.changeAppMode();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          //to apply theme
          Text("data", style: Theme.of(context).textTheme.displayLarge),
          const Text("data"),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSecondScreen);
            },
            child: const Text("data"),
          ),
          const Icon(Icons.add),
          const Icon(Icons.add_alert_outlined),
        ],
      ),
    );
  }
}