import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_chat/dialog_utils.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/iChats_screen.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../cubiT/credential/credential_cubit.dart';

class Toolbar extends StatefulWidget with PreferredSizeWidget {
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
  State<Toolbar> createState() => _ToolbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
    return _container();
  }

  Widget _container() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(widget.titleToolBar),
      titleTextStyle: widget.titleStyle,
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
        if (widget.indexCurrent == GetTitleToolBar.iChats.index)
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
        if (widget.indexCurrent == GetTitleToolBar.Call.index)
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
        if (widget.indexCurrent == GetTitleToolBar.Group.index)
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteConst.addMemberToGroupRoutes);
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        if (widget.indexCurrent == GetTitleToolBar.Setting.index)
          IconButton(
            onPressed: () => _onPressSignOut(context),
            icon: const Icon(Icons.logout),
          )
      ],
    );
  }

  void _onPressSignOut(BuildContext context) {
    DialogUtils.showDialogConfirm(
      context: context,
      title: 'Are you sure want to log out?',
      onCancel: () {
        Navigator.of(context).pop();
      },
      onConfirm: () {
        BlocProvider.of<CredentialCubit>(context).onSubmitSignOut();
        Navigator.of(context).pop();
      },
    );
  }
}
