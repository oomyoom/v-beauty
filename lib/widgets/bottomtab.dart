import 'package:flutter/material.dart';
import 'package:v_beauty/home/view/home_page.dart';
import 'package:v_beauty/profile/view/pages/profile_page.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomePage(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE5C1C5),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink[700],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Build'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
