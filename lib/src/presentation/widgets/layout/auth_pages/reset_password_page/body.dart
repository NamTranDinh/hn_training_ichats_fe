import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';

import '../../../drawable/button_text.dart';
import '../../../drawable/password_form_text.dart';
import '../../../theme/app_color.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passController = TextEditingController();
    var rePassController = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 56),
        PasswordFormField(
          onChanged: (value) {},
          controller: passController,
          validator: (value) {
            value = passController.text;
          },
          styleOutLinePass: StyleOutLinePass.outlineInputBorder,
          borderColor: purple900,
          textInputAction: TextInputAction.next,
          labelText: 'New Password',
        ),
        const SizedBox(height: 8),
        PasswordFormField(
          onChanged: (value) {},
          controller: rePassController,
          validator: (value) {
            value = rePassController.text;
          },
          styleOutLinePass: StyleOutLinePass.outlineInputBorder,
          borderColor: purple900,
          textInputAction: TextInputAction.done,
          labelText: 'Confirm Password',
        ),
        const SizedBox(height: 8),
        ButtonText(
          onPressed: () {
            Navigator.pushNamed(context, RouteConst.signInRoute);
          },
          height: 46,
          backgroundColor: purple700,
          radius: 23,
          isUppercase: true,
          text: 'Confirm',
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteConst.signInRoute);
            },
            child: const Text(
              'or log in instead',
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 12,
                  color: Colors.deepPurple),
            )),
      ],
    );
  }
}
