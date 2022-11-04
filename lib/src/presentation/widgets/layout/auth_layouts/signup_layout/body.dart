import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/widgets/drawable/email_form_field.dart';
import 'package:i_chat/src/presentation/widgets/drawable/password_form_text.dart';

import '../../../drawable/button_text.dart';
import '../../../theme/app_color.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var rePassController = TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        EmailFormField(
          controller: emailController,
          onChanged: (value) {
            value = emailController.text;
          },
          validator: (value) {},
          styleOutLineEmail: StyleOutLineEmail.outlineInputBorder,
          borderColor: purple900,
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: 8),
        PasswordFormField(
          controller: passController,
          onChanged: (value) {},
          validator: (value) {
            value = passController.text;
          },
          styleOutLinePass: StyleOutLinePass.outlineInputBorder,
          borderColor: purple900,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 8),
        PasswordFormField(
          controller: rePassController,
          onChanged: (value) {},
          validator: (value) {
            value = rePassController.text;
          },
          styleOutLinePass: StyleOutLinePass.outlineInputBorder,
          borderColor: purple900,
          labelText: 'Re-password',
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 12),
        ButtonText(
          onPressed: () {

          },
          height: 46,
          backgroundColor: purple700,
          radius: 23,
          isUppercase: true,
          text: 'sign up',
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
