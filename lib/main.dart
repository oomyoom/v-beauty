import 'package:flutter/material.dart';
import 'package:v_beauty/profile/view/components/profile_edit.dart';
import 'package:v_beauty/widgets/bottomtab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-Beauty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomTab(),
    );
  }
}
