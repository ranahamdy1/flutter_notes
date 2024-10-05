import 'package:flutter/material.dart';
import 'package:try_all/stripe_payment/payment_manager.dart';

class MyFirstScreen extends StatelessWidget {
  const MyFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  PaymentManager p = PaymentManager();
                  await p.makePayment(20, "EGP");
                },
                child: const Text("Pay "))
          ],
        ),
      ),
    );
  }
}
