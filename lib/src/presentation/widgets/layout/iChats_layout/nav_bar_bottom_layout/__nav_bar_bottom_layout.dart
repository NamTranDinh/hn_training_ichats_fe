import 'package:flutter/material.dart';

import '../../../drawable/custom_nav_bar_with_animation.dart';
import '../../../../../config/theme/app_color.dart';
import '../body_layout/home.dart';
import '../body_layout/setting.dart';

class NavBarBottomLayout extends StatefulWidget {
  const NavBarBottomLayout({Key? key}) : super(key: key);

  @override
  State<NavBarBottomLayout> createState() => _NavBarBottomLayoutState();

}

class _NavBarBottomLayoutState extends State<NavBarBottomLayout> {
  int _currentIndex = 0;

  final _inactiveColor = const Color.fromRGBO(186, 184, 194, 1);

  @override
  Widget build(BuildContext context) {
    return CustomNavBarWithAnimation(
      totalItem: 4,
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.decelerate,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: [
        BottomNaviBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: purple900,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNaviBarItem(
          icon: const Icon(Icons.videocam_outlined),
          title: const Text('Call'),
          activeColor: purple900,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNaviBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          activeColor: purple900,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const Home(),
      const Card(),
      const Setting(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
