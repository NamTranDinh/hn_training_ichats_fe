import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/presentation/cubiT/auth/auth_cubit.dart';
import 'package:i_chat/src/presentation/cubiT/credential/credential_cubit.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/welcome_screen.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_layout/app_bar_layout/tool_bar.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_layout/body_layout/call.dart';
import 'package:i_chat/src/presentation/widgets/layout/iChats_layout/body_layout/group.dart';
import 'package:i_chat/toast_utils.dart';
import '../../../config/theme/app_color.dart';

import '../../widgets/drawable/custom_nav_bar_with_animation.dart';
import '../../widgets/layout/iChats_layout/body_layout/home.dart';
import '../../widgets/layout/iChats_layout/body_layout/setting.dart';

class IChatsScreen extends StatefulWidget {
  final String? userId;

  const IChatsScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<IChatsScreen> createState() => _IChatsScreenState();
}

class _IChatsScreenState extends State<IChatsScreen> {
  int _currentIndex = 0;

  final _inactiveColor = const Color.fromRGBO(186, 184, 194, 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialCubit, CredentialState>(
      listener: (context, credentialState) {
        /// here the listener state will be emitted from the `CredentialCubit` vio `emit`
        if (credentialState is CredentialSuccess) {
          BlocProvider.of<AuthCubit>(context).signedOut();
          ToastUtils.showToast('CredentialSuccess sign out');
        }
        if (credentialState is CredentialFailure) {
          ToastUtils.showToast('CredentialFailure sign out');
        }
      },
      builder: (context, credentialState) {
        if (credentialState is CredentialLoading) {
          return const WelcomeScreen();
        }
        if (credentialState is CredentialSuccess) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              if (authState is SignInScreen) {
                return const SignInScreen();
              } else {
                return _container();
              }
            },
          );
        }
        if (credentialState is CredentialFailure) {}

        return _container();
      },
    );
  }

  Widget _container() {
    return Scaffold(
        appBar: Toolbar(
          titleToolBar: GetTitleToolBar.values[_currentIndex].name,
          titleStyle:
              const TextStyle(fontFamily: 'Poppins-Medium', fontSize: 22),
          indexCurrent: _currentIndex,
        ),
        body: getBody(),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
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
          icon: const Icon(Icons.groups),
          title: const Text('Group'),
          activeColor: purple900,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNaviBarItem(
          icon: const Icon(Icons.videocam_outlined),
          title: const Text('Calls'),
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
