// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:v_beauty/features/auth/ui/auth_screen.dart';
import 'package:v_beauty/features/store_features/widgets/store_bottom_tab.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/order_history/bloc/order_bloc.dart';
import 'package:v_beauty/utils/token_management.dart';
import 'package:v_beauty/widget/bottom_tab.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      _checkTokenExpiration();
    });
  }

  void _checkTokenExpiration() async {
    // เพิ่มการตรวจสอบ mounted ที่นี่เพื่อหลีกเลี่ยงการใช้ context หลังจาก widget ถูก unmount
    if (!mounted) return;

    if (!await checkTokenExpiration()) {
      final String? token = await getToken();
      var decodedToken = JwtDecoder.decode(token!);

      if (decodedToken['role_id'] == 1) {
        context.read<ProfileBloc>().add(ProfileLoad());
        context.read<OrderBloc>().add(LoadOrder());
        // ตรวจสอบ mounted อีกครั้งก่อนทำการนำทาง
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomTab(),
          ),
        );
      } else if (decodedToken['role_id'] == 3) {
        // ตรวจสอบ mounted อีกครั้งก่อนทำการนำทาง
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const StoreBottomTab(),
          ),
        );
      }
    } else {
      // ตรวจสอบ mounted อีกครั้งก่อนทำการนำทาง
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ),
      );
    }
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
