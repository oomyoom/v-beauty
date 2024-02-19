import 'package:flutter/material.dart';

class MyRegisterTextField extends StatelessWidget {
  final contorller;
  final String hintText;
  final bool obscureText;
  const MyRegisterTextField({super.key, this.contorller, required this.hintText, required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: contorller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}