import 'package:flutter/material.dart';
import 'package:v_beauty/features/user_features/home/ui/home_screen.dart';
import 'package:v_beauty/features/user_features/profile/view/pages/profile_page.dart';
import 'package:v_beauty/features/user_features/shop/ui/shop_screen.dart';

class BottomTab extends StatefulWidget {
  final token;
  const BottomTab({@required this.token, super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  late final PageController _page;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _page = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children: <Widget>[
          HomePage(token: widget.token),
          ShoppingPage(token: widget.token),
          const ProfilePage(),
          // TestApi(token: widget.token),
          // ProfilePage(token: widget.token),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.animateToPage(
              page,
              duration: const Duration(microseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop_rounded,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}