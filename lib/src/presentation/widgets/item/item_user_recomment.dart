import 'package:flutter/material.dart';

import '../../../config/app_const.dart';

class ItemUserRecommend extends StatefulWidget {
  final int index;

  const ItemUserRecommend({super.key, required this.index});

  @override
  State<ItemUserRecommend> createState() => _ItemUserRecommendState();
}

class _ItemUserRecommendState extends State<ItemUserRecommend> {
  /// 0 -> not select
  /// 1 -> selected
  int _isSelected = -1;
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
                borderRadius: BorderRadius.circular(26),
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
                        'User recommend ${widget.index}',
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
                    child: Radio(
                      value: int.parse('${widget.index}'),
                      groupValue: _isSelected,
                      onChanged: (int? value) {
                        print(value);
                        setState(() {
                          _isSelected = value!;
                        });
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
