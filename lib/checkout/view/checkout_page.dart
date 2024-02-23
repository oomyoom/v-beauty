import 'package:flutter/material.dart';
import 'package:v_beauty/checkout/view/components/cartItem_section.dart';
import 'package:v_beauty/checkout/view/components/delivery_section.dart';
import 'package:v_beauty/checkout/view/components/payment_section.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.totalAmount});

  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เช็คเอาท์'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.04),
                    child: CartItemSection(totalAmount: totalAmount),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04),
                    child: const DeliverySection(),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: const PaymentSection()),
                ],
              ),
            ),
          ),
          InkWell(
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
          ))
        ],
      ),
    );
  }
}
