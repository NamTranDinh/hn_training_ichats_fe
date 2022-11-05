import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';

class ItemCall extends StatelessWidget {
  static const String _inComingCalls = 'Incoming call';
  static const String _outComingCalls = 'Outgoing call';

  final int index;

  const ItemCall({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey.shade200,
      onTap: () {

      },
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
                      const Text(
                        'Tran Dinh Nam',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),

                      // msg
                      Row(
                        children: [
                          const Icon(Icons.phone_callback_rounded, color: Colors.black54, size: 13,),
                          const Text(
                            '\t\t $_inComingCalls',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontFamily: 'Poppins-Medium',
                            ),
                          ),
                          Text(
                              '\t\t-\t\t${getDateFromTimeCurrent(randomTime())}'),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox.fromSize(
              size: const Size(36, 36),
              child: ClipOval(
                child: Material(
                  color: Colors.grey.shade300,
                  child: InkWell(
                    splashColor: Colors.grey.shade100,
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.call, color: Colors.black87, size: 18,),
                      ],
                    ),
                  ),
                ),
              ),
            )
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

  int randomTime() {
    return Random().nextInt(999999) + 1000000;
  }
}
