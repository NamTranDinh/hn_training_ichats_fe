import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/widgets/drawable/email_form_field.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../drawable/button_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 56),
        EmailFormField(
          controller: emailController,
          onChanged: (value) {
            value = emailController.text;
          },
          validator: (value) {},
          styleOutLineEmail: StyleOutLineEmail.outlineInputBorder,
          borderColor: purple900,
          textInputAction: TextInputAction.done,
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: 8),
        ButtonText(
          onPressed: () {
            Navigator.pushNamed(context, RouteConst.getOtpRoute);
          },
          height: 46,
          backgroundColor: purple700,
          radius: 23,
          isUppercase: true,
          text: 'recover password',
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
