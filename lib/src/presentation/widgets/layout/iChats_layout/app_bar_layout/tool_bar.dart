import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/iChats_screen.dart';

import '../../../../../config/theme/app_color.dart';


class Toolbar extends StatelessWidget with PreferredSizeWidget {
  final String titleToolBar;
  final TextStyle? titleStyle;
  final int indexCurrent;

  const Toolbar({
    super.key,
    required this.titleToolBar,
    this.titleStyle,
    required this.indexCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(titleToolBar),
      titleTextStyle: titleStyle,
      leading: Container(
        margin: const EdgeInsets.only(left: 12.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            '${PathAssetConst.assetsImage}ic_holder_user.svg',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      leadingWidth: 55,
      backgroundColor: Colors.transparent,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: purple900,
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              '${PathAssetConst.assetsImage}oval_tl.svg',
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              '${PathAssetConst.assetsImage}oval_br.svg',
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        if(indexCurrent == GetTitleToolBar.iChats.index)
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        if(indexCurrent == GetTitleToolBar.Call.index)
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.videocam_rounded),
              ),
            ],
          ),
        if(indexCurrent == GetTitleToolBar.Group.index)
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteConst.addMemberToGroupRoutes);
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        if(indexCurrent == GetTitleToolBar.Setting.index)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

}
