import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/models/product_data.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key, required this.product});
  final List<ProductModal> product;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            product.length,
            (index) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: InkWell(
                  onTap: () {
                    context.read<CartBloc>().add(CartItemAdded(product[index]));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProductPage(
                    //       pic: product[index].image,
                    //       title: product[index].productName,
                    //       price: product[index].price,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    NetworkImage('${product[index].image}'))),
                      ),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${product[index].name}',
                              style: Theme.of(context).textTheme.bodyMedium!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.003),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '฿ ${product[index].price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.pink),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Text(
                                      '4.8',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: const Color(0xFF615C62)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
