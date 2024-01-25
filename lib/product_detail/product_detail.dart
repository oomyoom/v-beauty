// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:v_beauty/home/view/components/custom_appbar.dart';
import 'package:v_beauty/models/product.dart';

class pf_detailPage extends StatelessWidget {
  String pic;
  String title;
  double price;
  pf_detailPage(
      {super.key, required this.pic, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    var select_item = 0;
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              actions: [
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: null),
              ],
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.7,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 10)]),
                        child: Image(image: NetworkImage(pic)),
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.width * 0.55,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.03),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [BoxShadow(blurRadius: 10)],
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.width * 0.275,
                          child: Image(image: NetworkImage(pic)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.03),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [BoxShadow(blurRadius: 10)],
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.width * 0.275,
                          child: Image(image: NetworkImage(pic)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              sliver: SliverToBoxAdapter(
                  child: Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30),
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              sliver: SliverToBoxAdapter(
                  child: Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    const Icon(
                      IconData(0xe5fd, fontFamily: 'MaterialIcons'),
                      color: Colors.yellow,
                    ),
                    const Icon(IconData(0xe5fd, fontFamily: 'MaterialIcons'),
                        color: Colors.yellow),
                    const Icon(IconData(0xe5fd, fontFamily: 'MaterialIcons'),
                        color: Colors.yellow),
                    const Icon(IconData(0xe5fd, fontFamily: 'MaterialIcons'),
                        color: Colors.yellow),
                    const Icon(IconData(0xe5fd, fontFamily: 'MaterialIcons')),
                    Text('(4.0)'), // change to variable later
                    Text(
                      ' | ',
                    ),
                    Text('28.3 พันขายแล้ว') // change to variable later
                  ],
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  color: Color(0xFFE5C1C5),
                  child: Text(
                    ' $price บาท',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'จำนวน ',
                        style: TextStyle(fontSize: 10),
                      ),
                      InkWell(
                        child: Icon(Icons.indeterminate_check_box),
                        onTap: () {
                          setState() {
                            select_item++;
                          }
                        },
                      ),
                      Text(
                        '   $select_item   ',
                        style: TextStyle(fontSize: 10),
                      ),
                      InkWell(
                        child: Icon(Icons.check_box),
                        onTap: () {
                          setState() {
                            select_item++;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              sliver: SliverToBoxAdapter(
                child: Container(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt_outlined),
                                Text(' Filter Makeup',
                                    style: TextStyle(fontSize: 25))
                              ]),
                          color: Color(0xFFE5C1C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.002),
              sliver: SliverToBoxAdapter(
                child: Container(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.06,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ซื้อสินค้า',
                                    style: TextStyle(fontSize: 15))
                              ]),
                          color: Color(0xFFE5C1C5),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.22,
                        child: InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.06,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('เพิ่มไปยังตะกร้า',
                                      style: TextStyle(fontSize: 15))
                                ]),
                            color: Color(0xFFE5C1C5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black12),
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Watsons_logotype.svg/950px-Watsons_logotype.svg.png'),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.width * 0.2,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Watson Official Store'),
                                  Row(children: [
                                    InkWell(
                                      child: Container(
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.008),
                                            child: Text('แชทเลย')),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black12),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    InkWell(
                                      child: Container(
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.008),
                                            child: Text('ดูร้านค้า')),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black12),
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black12),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.width * 0.205,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('5ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('4ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('3ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('2ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('1ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.002),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      color: Colors.white),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.01),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black12,
                              child: Text(
                                'รายละเอียดสินค้า',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.01),
                            child: Container(
                              
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('หมวดหมู่สินค้า'),
                                    Text('หมวดหมู่สินค้า'),
                                    Text('หมวดหมู่สินค้า'),
                                    Text('หมวดหมู่สินค้า'),
                                    Text('หมวดหมู่สินค้า')
                                  ]),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
