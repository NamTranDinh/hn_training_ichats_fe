import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';

class ItemChat extends StatelessWidget {
  final int index;

  const ItemChat({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteConst.userChatRoutes);
      },
      splashColor: Colors.grey.shade200,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 52,
              width: 52,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child:
                    Image.asset('${PathAssetConst.assetsAppIcons}playstore.png'),
              ),
            ),
            Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name user
                      Text(
                        'User $index',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),

                      // msg
                      const Text(
                        'Hello.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // time 1667628613
                    Text(getDateFromTimeCurrent(randomTime())),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDateFromTimeCurrent(int timestamp) {
    var now = DateTime.now();

    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    var format = formatDate(date, [HH, ':', nn]);

    return format;
  }

  String getCurrentDateTime() {
    var now = DateTime.now();
    return now.toString();
  }

  int randomTime(){
    return Random().nextInt(999999)+1000000;
  }
}
