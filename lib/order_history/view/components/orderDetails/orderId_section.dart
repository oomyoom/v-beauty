import 'package:flutter/material.dart';
import 'package:v_beauty/order_history/models/order.dart';

class OrderIdSection extends StatelessWidget {
  const OrderIdSection({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'รหัสคำสั่งซื้อ',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            order.orderId,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            order.createAt.substring(0, 16),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black38),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
        ],
      ),
    );
  }
}
