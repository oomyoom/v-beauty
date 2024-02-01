import 'package:flutter/material.dart';
import 'package:v_beauty/models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ตะกร้า'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: List.generate(
                        productData.length,
                        (index) => Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(0.5), // สีของเงา
                                          spreadRadius:
                                              5, // รัศมีการกระจายของเงา
                                          blurRadius: 7, // ความคมของเงา
                                          offset: const Offset(
                                              0, 3), // ตำแหน่งของเงา (x, y)
                                        ),
                                      ]),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    productData[index].image))),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                productData[index].title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '฿ ${productData[index].price.toStringAsFixed(0)}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: Colors.pink),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.pink[50],
                                                            shape: BoxShape
                                                                .rectangle,
                                                            borderRadius: BorderRadius
                                                                .circular(MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.02)),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                Icons
                                                                    .remove_rounded,
                                                                size: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.04)),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.015),
                                                        child: Text('1',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    color: const Color(
                                                                        0xFF615C62))),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.pink[50],
                                                            shape: BoxShape
                                                                .rectangle,
                                                            borderRadius: BorderRadius
                                                                .circular(MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.02)),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                Icons
                                                                    .add_rounded,
                                                                size: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                )
                              ],
                            )),
                  )),
            ),
          ),
          Container(
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
                      '฿ 260',
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
            ),
          )
        ],
      ),
    );
  }
}
