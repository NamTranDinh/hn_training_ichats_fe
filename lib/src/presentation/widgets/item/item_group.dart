import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';

class ItemGroup extends StatelessWidget {
  final int index;

  const ItemGroup({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                    '${PathAssetConst.assetsAppIcons}playstore.png'),
              ),
            ),
            Expanded(
                flex: 8,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name user
                      Text(
                        'Name Group $index',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                    ],
                  ),
                )),
            Center(
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                    width: 30,
                    margin: const EdgeInsets.only(left: 12),
                    child: const Icon(Icons.more_vert)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
