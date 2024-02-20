import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/cart/view/components/cart_item.dart';
import 'package:v_beauty/cart/view/components/checkout_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตะกร้า'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const Center(
              child: Text('ไม่มีสินค้า'),
            );
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.02),
                    child: Column(
                      children: List.generate(
                        state.cartItems.length,
                        (index) {
                          final item = state.cartItems[index];
                          return CartItemWidget(item: item);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              CheckoutButton(cartItems: state.cartItems),
            ],
          );
        },
      ),
    );
  }
}
