import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/widgets/item/item_user_circle.dart';
import 'package:i_chat/src/presentation/widgets/item/item_user_recomment.dart';

import '../../../config/app_const.dart';
import '../../../config/theme/app_color.dart';
import '../../widgets/drawable/custom_search.dart';

class AddMemberToGroupScreen extends StatefulWidget {
  const AddMemberToGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddMemberToGroupScreen> createState() => _AddMemberToGroupScreenState();
}

class _AddMemberToGroupScreenState extends State<AddMemberToGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add members'),
        titleTextStyle:
            const TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18),
        backgroundColor: purple900,
        actions: [
          TextButton(
            onPressed: () {Navigator.pushNamed(context, RouteConst.createGroupScreen);},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.transparent)),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.white.withOpacity(0.04);
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return Colors.white.withOpacity(0.12);
                  }
                },
              ),
            ),
            child: const Text('Next', style: (TextStyle(color: Colors.white))),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              CustomSearch(
                backgroundColor: Colors.grey.shade300,
                prefixIcon: Icons.search,
                margin:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                radius: 50,
                onTap: () {
                  Navigator.pushNamed(context, RouteConst.searchRoutes);
                },
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ItemUserCircle(),
                    ItemUserCircle(),
                    ItemUserCircle(),
                    ItemUserCircle(),
                    ItemUserCircle(),
                    ItemUserCircle(),
                    ItemUserCircle(),
                    ItemUserCircle(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey.shade300,
            height: 1,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ItemUserRecommend(
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
