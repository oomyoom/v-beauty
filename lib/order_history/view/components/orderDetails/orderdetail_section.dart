import 'package:flutter/material.dart';
import 'package:v_beauty/order_history/models/order.dart';

class OrderDetailSection extends StatelessWidget {
  const OrderDetailSection({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'รายละเอียด',
              style: Theme.of(context).textTheme.titleLarge!,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(order.orderlines.length, (index) {
              final item = order.orderlines[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  - ${item.productItem.name} x ${item.quantity}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!,
                      ),
                      Text('฿ ${item.productItem.price}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.pink)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                ],
              );
            })),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ราคา',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '฿ ${order.total}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.pink),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black26, width: 1))),
          ),
        ),
      ],
    );
  }
}
