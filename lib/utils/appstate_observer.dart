// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
      checkTokenExpiration();
    }
  }

  void checkTokenExpiration() async {
    final String? token = await getToken();
    if (token == null || JwtDecoder.isExpired(token)) {
      await removeToken(); // ตรวจสอบวิธีการลบ token ของคุณ
      showSessionExpiredSnackbarAndNavigate(context);
    }
    // ถ้ามี token และไม่หมดอายุ, ไม่ทำอะไร
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
