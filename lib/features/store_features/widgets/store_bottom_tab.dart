import 'package:flutter/material.dart';
import 'package:v_beauty/features/store_features/store_home/ui/store_home_screen.dart';

class StoreBottomTab extends StatefulWidget {
  final token;
  const StoreBottomTab({@required this.token, super.key});

  @override
  State<StoreBottomTab> createState() => _StoreBottomTabState();
}

class _StoreBottomTabState extends State<StoreBottomTab> {
  late final PageController _storepage;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _storepage = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _storepage,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children:  <Widget> [
          StoreHomePage(),
          StoreHomePage(),
          StoreHomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _storepage.animateToPage(
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

// Scaffold(
//       body: Center(
//         child: GestureDetector(
//             onTap: () {
//               showLogoutConfirmationDialog(context);
//             },
//             child: const Text('Store')),
//       ),
//     );