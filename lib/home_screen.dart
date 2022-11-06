import 'package:flutter/material.dart';
import 'package:my_project_template/test_screen1.dart';
import 'package:my_project_template/test_screen2.dart';

import 'features/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _navIndex = 0;

  late Widget _currentWidget;

  @override
  void initState() {
    _currentWidget = const TestScreen1();
    super.initState();
  }

  //!数字で画面きりかえの仕組み
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _currentWidget = const TestScreen1();
      } else if (_selectedIndex == 1) {
        _currentWidget = const TestScreen2();
      } else if (_selectedIndex == 2) {
        _currentWidget = const ProfileScreen();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: ('test1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: ('test2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: ('マイページ'),
          ),
        ],
        onTap: (int index) {
          setState(
            () {
              _navIndex = index;
              _onItemTapped(index);
            },
          );
        },
        currentIndex: _navIndex,
        iconSize: 40,
      ),
      body: SafeArea(child: _currentWidget),
    );
  }
}
