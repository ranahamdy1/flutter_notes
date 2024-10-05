import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:try_all/core/utils/app_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body:  Column(
        children: [
          InkWell(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kThirdScreen);
            },
              child: const Text("data")),
        ],
      ),
    );
  }
}
