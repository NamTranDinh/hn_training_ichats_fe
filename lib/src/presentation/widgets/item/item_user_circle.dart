import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';

class ItemUserCircle extends StatelessWidget {
  const ItemUserCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.transparent,
            child: ClipOval(
                child: Image.asset(
              '${PathAssetConst.assetsAppIcons}playstore.png',
              fit: BoxFit.contain,
              matchTextDirection: true,
              height: 60,
            )),
          ),
          Positioned(
            right: 0,
            top: 0,
            child:  Container(
              alignment: Alignment.center,
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.45),
                    spreadRadius: -.05,
                    blurRadius: 1.2,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ]
              ),
              child: IconButton(
                icon: const Icon(Icons.clear, size: 16,),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  print("Icon Button clicked");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
