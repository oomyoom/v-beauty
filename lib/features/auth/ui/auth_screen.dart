// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/features/auth/components/auth_button.dart';
import 'package:v_beauty/features/auth/components/auth_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:v_beauty/features/splash/splash_screen.dart';
import 'package:v_beauty/utils/tokenManagement.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  Future<void> signUserIn() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        'Email': emailController.text,
        'Password': passwordController.text
      };

      var response = await http.post(
        Uri.parse('http://${ApiConstants.authUrl}'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == "success") {
        var myToken = jsonResponse['token'];
        saveToken(myToken);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          ),
        );
      } else {
        print('Something went wrong: ${response.body}');
      }
    }
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.access_alarm,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("Welcome back you 've been missed!"),
                const SizedBox(
                  height: 25,
                ),
                MyAuthTextField(
                  hintText: 'Email',
                  obscureText: false,
                  contorller: emailController,
                ),
                const SizedBox(
                  height: 25,
                ),
                MyAuthTextField(
                  hintText: 'Password',
                  obscureText: true,
                  contorller: passwordController,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyAuthButton(
                  onTap: () {
                    print('User Login');
                    signUserIn();
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Register');
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
                // LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
