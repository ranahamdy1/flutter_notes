import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentManager {
  Future<void> makePayment(int amount, String currency) async {
    try {
      await Stripe.instance.applySettings();
      var jsonData = await getData((amount).toString());
      await _initializePaymentSheet2(jsonData);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> _initializePaymentSheet2(jsonData) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: jsonData['client_secret_key'],
        merchantDisplayName: "RANA",
        customerId: jsonData['customer'],
        customerEphemeralKeySecret: jsonData['ephemeralKey'],
      ),
    );
  }

  Future getData(String amount) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://19fd-197-43-13-71.ngrok-free.app/api/payment/intent',
      options: Options(
        headers: {
          'Authorization':
              'Bearer 7|CUr7dLRFEneRXlaDBavhHafVuIu2iorNYwmeeChz7efc5d2b',
        },
      ),
      data: {'amount': amount},
    );
    print(response.data);
    return response.data;
  }
}
