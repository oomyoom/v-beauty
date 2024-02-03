import 'package:flutter/material.dart';
import 'package:v_beauty/features/user_features/profile/ui/components/profile_logout.dart';

class StoreBottomTab extends StatefulWidget {
  final token;
  const StoreBottomTab({@required this.token, Key? key}) : super(key: key);

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
            child: Text('Store')),
      ),
    );
  }
}
