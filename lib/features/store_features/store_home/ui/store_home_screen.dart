import 'package:flutter/material.dart';

class StoreHomePage extends StatefulWidget {
  final token;
  const StoreHomePage({@required this.token, super.key});

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}