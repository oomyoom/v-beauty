import 'package:flutter/material.dart';
import 'package:v_beauty/features/user_features/profile/view/components/profile_page/profile_logout.dart';

class StoreBottomTab extends StatefulWidget {
  const StoreBottomTab({super.key});

  @override
  State<StoreBottomTab> createState() => _StoreBottomTabState();
}

class _StoreBottomTabState extends State<StoreBottomTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              showLogoutConfirmationDialog(context);
            },
            child: const Text('Store')),
      ),
    );
  }
}
