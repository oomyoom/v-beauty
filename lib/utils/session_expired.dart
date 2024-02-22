import 'package:flutter/material.dart';
import 'package:v_beauty/features/splash/splash_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void showSessionExpiredSnackbarAndNavigate(BuildContext context) {
  // แสดง Snackbar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Session expired, please login again.',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
  // รอและนำทางไปยัง SplashScreen
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SplashScreen()),
      (Route<dynamic> route) => false, // ไม่เก็บหน้าใดๆ เอาไว้
    );
  });
}
