import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: provider.increment,
                    child: const Text("+"),
                  ),
                  Text("${provider.counter}"),
                  TextButton(
                    onPressed: provider.decrement,
                    child: const Text("-"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
