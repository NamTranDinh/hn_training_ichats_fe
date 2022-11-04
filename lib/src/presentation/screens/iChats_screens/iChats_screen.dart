import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_layout/app_bar_layout/tool_bar.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_layout/body_layout/call.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_layout/body_layout/group.dart';
import 'package:i_chat/src/presentation/widgets/theme/app_color.dart';

import '../../widgets/drawable/custom_nav_bar_with_animation.dart';
import '../../widgets/layout/iChats_layout/body_layout/home.dart';
import '../../widgets/layout/iChats_layout/body_layout/setting.dart';

class IChatsScreen extends StatefulWidget {
  const IChatsScreen({Key? key}) : super(key: key);

  @override
  State<IChatsScreen> createState() => _IChatsScreenState();
}

class _IChatsScreenState extends State<IChatsScreen> {
  int _currentIndex = 0;

  final _inactiveColor = const Color.fromRGBO(186, 184, 194, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Toolbar(
          titleToolBar: GetTitleToolBar.values[_currentIndex].name,
          indexCurrent: _currentIndex,
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
          icon: const Icon(Icons.groups),
          title: const Text('Group'),
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
      const Group(),
      const Call(),
      const Setting(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}

enum GetTitleToolBar {
  iChats,
  // ignore: constant_identifier_names
  Group,
  // ignore: constant_identifier_names
  Call,
  // ignore: constant_identifier_names
  Setting
}
