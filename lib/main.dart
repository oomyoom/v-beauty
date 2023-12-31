import 'package:flutter/material.dart';
import 'package:v_beauty/home/view/home_page.dart';
import 'package:v_beauty/timer/timer.dart';
import 'package:v_beauty/widgets/bottomtab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomTab(),
    );
  }
}
