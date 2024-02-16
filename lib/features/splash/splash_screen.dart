import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:v_beauty/features/auth/ui/auth_screen.dart';
import 'package:v_beauty/features/store_features/widgets/store_bottom_tab.dart';
import 'package:v_beauty/widget/bottom_tab.dart';

class SplashScreen extends StatefulWidget {
  String? token;
  SplashScreen({@required this.token, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (widget.token != null) {
        var decodedToken = JwtDecoder.decode(widget.token!);
        if (decodedToken['role_id'] == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomTab(
                token: widget.token,
              ),
            ),
          );
        } else if (decodedToken['role_id'] == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoreBottomTab(
                token: widget.token,
              ),
            ),
          );
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 213),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'V Maker',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
