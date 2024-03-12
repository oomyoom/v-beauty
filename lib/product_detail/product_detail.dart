// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, use_build_context_synchronously, unused_field

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_beauty/home/view/components/custom_appbar.dart';
import 'package:v_beauty/models/product.dart';
import 'package:http/http.dart' as http;

class pf_detailPage extends StatefulWidget {
  String pic;
  String title;
  double price;
  pf_detailPage(
      {super.key, required this.pic, required this.title, required this.price});

  @override
  State<pf_detailPage> createState() => _pf_detailPageState();
}

class _pf_detailPageState extends State<pf_detailPage> {
  File? image;
  String? _processedImageUrl;

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
                        child: Image(image: NetworkImage(widget.pic)),
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
                          child: Image(image: NetworkImage(widget.pic)),
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
                          child: Image(image: NetworkImage(widget.pic)),
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
                  widget.title,
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
                    ' ${widget.price} บาท',
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
                          setState(() {
                            select_item++;
                          });
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
                        onTap: () async => {
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
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.06,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ซื้อสินค้า',
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
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.06,
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
                          width: MediaQuery.of(context).size.width * 0.5,
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
                                    'Watson Official Store',
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
        'POST', Uri.parse('http://192.168.1.105:5000/process_image'));
    request.headers['Connection'] = 'keep-alive';
    request.fields['type'] = 'lipstick';
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
