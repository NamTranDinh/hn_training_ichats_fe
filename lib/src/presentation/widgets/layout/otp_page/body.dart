import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/widgets/drawable/email_form_field.dart';
import 'package:i_chat/src/presentation/widgets/drawable/number_text_field.dart';
import 'package:i_chat/src/presentation/widgets/drawable/row_text.dart';
import '../../drawable/button_text.dart';
import '../../theme/app_color.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberTextField(
                onChanged: (String value) {},
                validator: (String? value) {},
                styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                borderColor: purple900,
                borderSize: 2,
                textInputAction: TextInputAction.next,
              ),
              NumberTextField(
                onChanged: (String value) {},
                validator: (String? value) {},
                styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                borderColor: purple900,
                borderSize: 2,
                textInputAction: TextInputAction.next,
              ),
              NumberTextField(
                onChanged: (String value) {},
                validator: (String? value) {},
                styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                borderColor: purple900,
                borderSize: 2,
                textInputAction: TextInputAction.next,
              ),
              NumberTextField(
                onChanged: (String value) {},
                validator: (String? value) {},
                styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                borderColor: purple900,
                borderSize: 2,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        RowText(
          onTap: () {

          },
          title1: 'If you don\'t receive code! ',
          title2: 'Resent.',
          title2Style: const TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 14,
              color: purple900
          ),
        ),
        const SizedBox(height: 16),
        ButtonText(
          onPressed: () {
            Navigator.pushNamed(context, RouteConst.resetPasswordRoute);
          },
          height: 46,
          backgroundColor: purple700,
          radius: 23,
          isUppercase: true,
          text: 'Verify',
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
