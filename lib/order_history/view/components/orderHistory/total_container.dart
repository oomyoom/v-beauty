import 'package:flutter/material.dart';
import 'package:v_beauty/order_history/models/order.dart';

class TotalContainer extends StatelessWidget {
  const TotalContainer({
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
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.03),
              bottomRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.03))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ราคา',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '฿ ${item.total}',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
