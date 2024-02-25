import 'package:flutter/material.dart';
import 'package:v_beauty/order_history/models/order.dart';

class OrderIdContainer extends StatelessWidget {
  const OrderIdContainer({
    super.key,
    required this.item,
  });

  final Order item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.04),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.04))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.orderId,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          Text(
            item.createAt.substring(0, 16),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
