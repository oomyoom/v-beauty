// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:v_beauty/features/splash/splash_screen.dart';
import 'package:v_beauty/utils/session_expired.dart';
import 'package:v_beauty/utils/token_management.dart';

class AppLifecycleReactor extends StatefulWidget {
  final Widget child;

  const AppLifecycleReactor({super.key, required this.child});

  @override
  _AppLifecycleReactorState createState() => _AppLifecycleReactorState();
}

class _AppLifecycleReactorState extends State<AppLifecycleReactor>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // แอปกลับมา active, ตรวจสอบ token
      _checkTokenExpiration();
    }
  }

  void _checkTokenExpiration() async {
    if (await checkTokenExpiration()) {
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const SplashScreen()),
        (Route<dynamic> route) => false, // ไม่เก็บหน้าใดๆ เอาไว้
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
