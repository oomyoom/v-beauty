// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, use_build_context_synchronously, unused_field

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/models/product_data.dart';
import 'package:v_beauty/rating/view/rating_page.dart';
import 'package:v_beauty/widget/custom_appbar.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModal product;

  ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  File? image;
  String? _processedImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              actions: const [ShoppingCartButton()],
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
                        child:
                            Image(image: NetworkImage(widget.product.image!)),
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
                          child:
                              Image(image: NetworkImage(widget.product.image!)),
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
                          child:
                              Image(image: NetworkImage(widget.product.image!)),
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
                  widget.product.name!,
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
                    RatingBarIndicator(
                      rating: widget.product.rating!,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 22,
                    ),
                    Text(
                        '(${widget.product.rating})'), // change to variable later
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
                    ' ${widget.product.price} บาท',
                    style: TextStyle(fontSize: 20),
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
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        onTap: () async => {
                          print(
                              'http://${ApiConstants.filterUrl}${widget.product.filterUrl}'),
                          await pickImage(),
                          await filterImage(),
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.all(1),
                                  content: AspectRatio(
                                      aspectRatio: 9 / 16,
                                      child: CustomScrollView(
                                        slivers: [
                                          SliverToBoxAdapter(
                                            child: Column(children: [
                                              AspectRatio(
                                                aspectRatio: 9 / 16,
                                                child: Container(
                                                  color: Colors.black26,
                                                  child: Image.memory(
                                                    base64Decode(
                                                        _processedImageUrl!),
                                                  ),
                                                ),
                                              ),
                                              // InkWell(
                                              //   onTap: () {
                                              //     filterImage();
                                              //   },
                                              //   child: Container(
                                              //       child:
                                              //           Text('ทำการแปลงภาพ')),
                                              // )
                                            ]),
                                          )
                                        ],
                                      )),
                                );
                              })
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt_outlined),
                                Text(' Filter Makeup',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03))
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RatingPage(
                                    productId: widget.product.productId!,
                                  )));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.06,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ให้คะแนน',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03))
                              ]),
                          color: Color(0xFFE5C1C5),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.22,
                        child: InkWell(
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(CartItemAdded(widget.product));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('เพิ่มไปยังตะกร้า',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03))
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
                          //width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Watsons_logotype.svg/950px-Watsons_logotype.svg.png'),
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: MediaQuery.of(context).size.width * 0.2,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.name!,
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                  ),
                                  Row(children: [
                                    InkWell(
                                      child: Container(
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.008),
                                            child: Text(
                                              'แชทเลย',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.03),
                                            )),
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
                                            child: Text(
                                              'ดูร้านค้า',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.03),
                                            )),
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
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('4ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
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
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Text('2ดาว :  '),
                                    Text(
                                      '1.2k',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
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
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
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

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }

    final imageTemporary = File(pickedImage.path);
    setState(() {
      image = imageTemporary;
      _processedImageUrl =
          null; // Reset processed image URL when selecting a new image
    });
  }

  Future<void> filterImage() async {
    if (image == null) {
      print('No image selected');
      return;
    }

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://${ApiConstants.filterUrl}'));
    request.headers['Connection'] = 'keep-alive';
    request.files.add(await http.MultipartFile.fromPath('image', image!.path));
    var response = await request.send();
    try {
      var responseString = await response.stream.bytesToString();
      print('responseString : ${responseString}');
      print('header pass check :${response.headers}');
      var processedImageUrl = json.decode(responseString)['processed_image'];
      setState(() {
        _processedImageUrl = processedImageUrl;
      });
    } catch (e) {
      print('Error: $e');
    }

    // if (response.statusCode == 200) {
    //   print('json = ${responseString}');
    //   var responseData = json.decode(responseString);
    //   String processedImageUrl = responseData['processed_image'];

    //   // Convert base64 เป็น binary data (bytes)
    //   List<int> processedImageBytes = base64.decode(processedImageUrl);

    //   // นำ binary data ไปใช้ต่อได้ตามต้องการ
    // } else {
    //   print('Failed to process image. Error: ${response.reasonPhrase}');
    // }
  }
}
