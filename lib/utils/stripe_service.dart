import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stripe_checkout/stripe_checkout.dart';
import 'package:v_beauty/cart/models/cart.dart';

class StripeService {
  static String secretKey =
      'sk_test_51NnohVGwhAFBd8QfkfJ3YHVUcD3FzTMDkejy0kxH0lEiNzCGGuX2aVQEhn4jjQAXfRPuhQEVywQwmCp8UFrihgW000Oxs2Vgql';
  static String publishableKey =
      'pk_test_51NnohVGwhAFBd8QfdfdQ7Of41LYhTW0qYBgjZRMa680n2rRUSGsgxeHY4bseBXfkhPOlOCLiHBjOZvspRI5IAZfC0093x5t3m5';

  static Future<dynamic> createCheckoutSession(
    List<CartItem> productItems,
    totalAmount,
  ) async {
    final url = Uri.parse('https://api.stripe.com/v1/checkout/sessions');

    String lineItems = '';
    int index = 0;

    for (var value in productItems) {
      var productPrice = (value.productItem.price! * 100).round();
      var totalPrice = productPrice;
      lineItems +=
          '&line_items[$index][price_data][product_data][name]=${value.productItem.name}';
      lineItems += '&line_items[$index][price_data][unit_amount]=$totalPrice';
      lineItems += '&line_items[$index][price_data][currency]=THB';
      lineItems += '&line_items[$index][quantity]=${value.quantity.toString()}';
      index++;
    }

    final response = await http.post(
      url,
      body:
          'success_url=https://checkout.stripe.dev/success&mode=payment$lineItems',
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return json.decode(response.body)['id'];
  }

  static Future<dynamic> stripePaymentCheckout(
    productItems,
    subTotal,
    context, {
    onSuccess,
    onCancel,
    onError,
  }) async {
    final String sessionId =
        await createCheckoutSession(productItems, subTotal);

    final result = await redirectToCheckout(
        context: context,
        sessionId: sessionId,
        publishableKey: publishableKey,
        successUrl: 'https://checkout.stripe.dev/success',
        canceledUrl: 'https://checkout.stripe.dev/cancel');

    final text = result.when(
        redirected: () => 'Redirected Successfully',
        success: () => onSuccess(),
        canceled: () => onCancel(),
        error: (e) => onError(e));
    return text;
  }
}
