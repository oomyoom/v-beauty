import 'package:flutter/material.dart';
import 'package:v_beauty/order_history/models/order.dart';
import 'package:v_beauty/order_history/view/components/orderDetails/orderId_section.dart';
import 'package:v_beauty/order_history/view/components/orderDetails/orderdetail_section.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'รายละเอียดคำสั่งซื้อ'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrderIdSection(order: order),
                OrderDetailSection(order: order),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
