import 'package:flutter/material.dart';
import 'package:v_beauty/features/user_features/home/ui/home_screen.dart';
import 'package:v_beauty/features/user_features/profile/view/pages/profile_page.dart';
import 'package:v_beauty/features/user_features/shop/ui/shop_screen.dart';
import 'package:v_beauty/rating/view/rating_page.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment',
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const RatingPage()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children: const <Widget>[
          HomePage(),
          ShoppingPage(),
          ProfilePage(),
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
              Icons.shopping_bag_rounded,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
