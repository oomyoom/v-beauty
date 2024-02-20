import 'package:flutter/material.dart';
import 'package:v_beauty/cart/models/cart.dart';

class CheckoutButton extends StatelessWidget {
  final List<CartItem> cartItems;

  const CheckoutButton({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final totalAmount = cartItems.fold<int>(
        0, (sum, item) => sum + (item.productItem.price ?? 0) * item.quantity);

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'ยอดรวมชำระเงิน',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  '฿ $totalAmount',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.pink, fontWeight: FontWeight.bold),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width * 0.1,
                        MediaQuery.of(context).size.height * 0.05),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFE5C1C5))),
              child: Text('ชำระเงิน'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!),
            ),
          ],
        ));
  }
}
