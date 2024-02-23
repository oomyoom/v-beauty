import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/cart/models/cart.dart';

class CartItemSection extends StatelessWidget {
  const CartItemSection({
    super.key,
    required this.totalAmount,
  });

  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.04),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(children: [
            Column(
              children: List.generate(
                state.cartItems.length,
                (index) {
                  final item = state.cartItems[index];
                  return Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: CheckoutItemWidget(item: item),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ยอดชำระรวม',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '฿ ${totalAmount.toString()}'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.pink, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}

class CheckoutItemWidget extends StatelessWidget {
  final CartItem item;

  const CheckoutItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.01),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.02),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.productItem.image!))),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.productItem.name!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '฿ ${item.productItem.price!.toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.pink),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.015),
                        child: Text('X ${item.quantity.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: const Color(0xFF615C62),
                                    fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
