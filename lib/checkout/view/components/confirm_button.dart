// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/cart/repositories/order_repo.dart';
import 'package:v_beauty/features/splash/splash_screen.dart';
import 'package:v_beauty/utils/session_expired.dart';
import 'package:v_beauty/utils/stripe_service.dart';
import 'package:v_beauty/utils/token_management.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    required this.totalAmount,
  });

  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return InkWell(
            onTap: () async {
              if (await checkTokenExpiration()) {
                showSessionExpiredSnackbarAndNavigate(context);
              } else {
                await StripeService.stripePaymentCheckout(
                    state.cartItems, totalAmount, context, onSuccess: () async {
                  print('Success');
                  await OrderRepository().createOrder(
                      state.paymentId, totalAmount, state.cartItems);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const SplashScreen()),
                    (Route<dynamic> route) => false, // ไม่เก็บหน้าใดๆ เอาไว้
                  );
                  context.read<CartBloc>().add(CartCleared());
                }, onCancel: () {
                  print('Cancel');
                }, onError: (e) {
                  print('Error: $e');
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              color: const Color(0xFFE5C1C5),
              child: Center(
                child: Text(
                  'ยืนยันการสั่งซื้อ'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ));
      },
    );
  }
}
