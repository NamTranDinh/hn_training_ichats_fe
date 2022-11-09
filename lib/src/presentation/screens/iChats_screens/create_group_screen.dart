import 'package:flutter/material.dart';

import '../../../config/theme/app_color.dart';
import '../../widgets/item/item_user_recomment.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create group'),
        titleTextStyle:
            const TextStyle(fontFamily: 'Poppins-Medium', fontSize: 18),
        backgroundColor: purple900,
        actions: [
          TextButton(
            onPressed: () {},
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
            child:
                const Text('Create', style: (TextStyle(color: Colors.white))),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 60,
                width: 200,
                alignment: Alignment.center,
                child: const Text(
                  'Name the new chat',
                  style: TextStyle(
                    fontFamily: 'Poppins-medium',
                    color: purple900,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.topCenter,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Group Name (Require)'
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Text('Participants', style: TextStyle(color: Colors.grey, fontSize: 16),),
          const SizedBox(height: 10,),
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
