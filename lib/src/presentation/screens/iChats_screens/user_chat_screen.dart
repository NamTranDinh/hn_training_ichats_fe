import 'package:flutter/material.dart';
import 'package:i_chat/src/config/theme/app_color.dart';
import 'package:i_chat/src/presentation/widgets/item/item_action_chatting.dart';

import '../../../config/app_const.dart';
import '../../widgets/item/item_space_chatting.dart';

class UserChatScreen extends StatefulWidget {
  const UserChatScreen({Key? key}) : super(key: key);

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          elevation: 2,
          backgroundColor: purple900,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 12),
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                      '${PathAssetConst.assetsAppIcons}playstore.png'),
                ),
              ),
              const Expanded(
                child: Text(
                  'Name User Chat',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: const Icon(
                Icons.call,
              ),
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: const Icon(
                Icons.videocam_rounded,
              ),
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline_rounded,
              ),
            ),
          ],
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
        ),
        body: Column(
          children: [
            const Expanded(child: ItemSpaceChatting()),
            ItemActionChatting(
              messageController: _messageController,
            ),
          ],
        ),
      ),
    );
  }
}
