import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/cart/models/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.01),
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // สีของเงา
              spreadRadius: 5, // รัศมีการกระจายของเงา
              blurRadius: 7, // ความคมของเงา
              offset: const Offset(0, 3), // ตำแหน่งของเงา (x, y)
            ),
          ]),
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
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
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
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.pink[50],
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02)),
                                child: IconButton(
                                    onPressed: () {
                                      if (item.quantity > 1) {
                                        cartBloc.add(CartItemQuantityChanged(
                                            item.productItem.productId!,
                                            item.quantity - 1));
                                      } else {
                                        // หรือใช้ event อื่นเพื่อนำสินค้าออกจากตะกร้าหากต้องการ
                                        cartBloc.add(CartItemRemoved(
                                            item.productItem.productId!));
                                      }
                                    },
                                    icon: Icon(Icons.remove_rounded,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.04)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.015),
                                child: Text(item.quantity.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: const Color(0xFF615C62))),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.pink[50],
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02)),
                                child: IconButton(
                                    onPressed: () {
                                      cartBloc.add(CartItemQuantityChanged(
                                          item.productItem.productId!,
                                          item.quantity + 1));
                                    },
                                    icon: Icon(Icons.add_rounded,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.04)),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        )
      ],
    );
  }
}
