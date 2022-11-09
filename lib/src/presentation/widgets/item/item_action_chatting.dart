import 'package:flutter/material.dart';

import '../../../config/theme/app_color.dart';

class ItemActionChatting extends StatefulWidget {
  const ItemActionChatting({
    super.key,
    required this.messageController,
  });

  final TextEditingController messageController;

  @override
  State<ItemActionChatting> createState() => _ItemActionChattingState();
}

class _ItemActionChattingState extends State<ItemActionChatting> {
  bool isActionVisible = true;

  @override
  void dispose() {
    widget.messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
              visible: isActionVisible ? false : true,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isActionVisible = !isActionVisible;
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.purple,
                ),
              )),
          Visibility(
            visible: isActionVisible,
            child: Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      splashRadius: 24,
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: purple900,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 24,
                      icon: const Icon(
                        Icons.image,
                        color: purple900,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 24,
                      icon: const Icon(
                        Icons.keyboard_voice,
                        color: purple900,
                        size: 24,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: purple900, width: 1),
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: TextField(
                        onTap: () {
                          setState(() {
                            isActionVisible = !isActionVisible;
                          });
                        },
                        cursorColor: Colors.purple,
                        textInputAction: TextInputAction.newline,
                        controller: widget.messageController,
                        maxLines: 5,
                        minLines: 1,
                        decoration: const InputDecoration(
                            hintMaxLines: 1,
                            border: InputBorder.none,
                            hintText: 'Type a message',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13)),
                      )),
                      Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Icon(
                            Icons.tag_faces_rounded,
                            color: Colors.grey.shade700,
                            size: 24,
                          )),
                    ],
                  ),
                )),
          ),
          IconButton(
            splashRadius: 24,
            onPressed: () {},
            icon: const Icon(
              Icons.send_rounded,
              color: purple900,
            ),
          )
        ],
      ),
    );
  }
}
