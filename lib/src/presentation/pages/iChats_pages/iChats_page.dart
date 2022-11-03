import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_pages/call_page.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_pages/setting_page.dart';

import '../../widgets/drawable/custom_nav_bar_with_animation.dart';
import '../../widgets/layout/iChats_pages/home_page.dart';

class IChatsPage extends StatefulWidget {
  const IChatsPage({Key? key}) : super(key: key);

  @override
  State<IChatsPage> createState() => _IChatsPageState();
}

class _IChatsPageState extends State<IChatsPage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("iChats App"),
          backgroundColor: Colors.green[200],
        ),
        body: getBody(),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return CustomNavBarWithAnimation(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.videocam_outlined),
          title: const Text('Call'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const CallPage(),
      const SettingPage(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
