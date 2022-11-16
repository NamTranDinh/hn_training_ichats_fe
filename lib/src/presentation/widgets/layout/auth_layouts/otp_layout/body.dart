import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/config/validator/validators.dart';
import 'package:i_chat/src/presentation/widgets/drawable/number_text_field.dart';
import 'package:i_chat/src/presentation/widgets/drawable/row_text.dart';
import 'package:i_chat/toast_utils.dart';

import '../../../drawable/button_text.dart';
import '../../../../../config/theme/app_color.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();

  var code1stController = TextEditingController();
  var code2ndController = TextEditingController();
  var code3rdController = TextEditingController();
  var code4thController = TextEditingController();

  @override
  void dispose() {
    code1stController.dispose();
    code2ndController.dispose();
    code3rdController.dispose();
    code4thController.dispose();
    super.dispose();
  }

  void onSubmitVerify() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, RouteConst.resetPasswordRoute);
      ToastUtils.showToast(
          '${code1stController.text} ${code2ndController.text} ${code3rdController.text} ${code4thController.text} ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _container();
  }

  Widget _container() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberTextField(
                  onChanged: (String value) {
                    value = code1stController.text;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !Validators.isNumberValid(value)) {
                      return '';
                    }
                    return null;
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                  borderColor: purple900,
                  borderSize: 2,
                  textInputAction: TextInputAction.next,
                  controller: code1stController,
                ),
                NumberTextField(
                  onChanged: (String value) {
                    value = code2ndController.text;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !Validators.isNumberValid(value)) {
                      return '';
                    }
                    return null;
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: code2ndController,
                  styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                  borderColor: purple900,
                  borderSize: 2,
                  textInputAction: TextInputAction.next,
                ),
                NumberTextField(
                  onChanged: (String value) {
                    value = code3rdController.text;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !Validators.isNumberValid(value)) {
                      return '';
                    }
                    return null;
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: code3rdController,
                  styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                  borderColor: purple900,
                  borderSize: 2,
                  textInputAction: TextInputAction.next,
                ),
                NumberTextField(
                  onChanged: (String value) {
                    value = code4thController.text;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !Validators.isNumberValid(value)) {
                      return '';
                    }
                    return null;
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: code4thController,
                  styleOutLineOtp: StyleOutLineOTP.outlineInputBorder,
                  borderColor: purple900,
                  borderSize: 2,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          RowText(
            onTap: () {},
            title1: 'If you don\'t receive code! ',
            title2: 'Resent.',
            title2Style: const TextStyle(
                fontFamily: 'Poppins-Bold', fontSize: 14, color: purple900),
          ),
          const SizedBox(height: 18),
          ButtonText(
            onPressed: onSubmitVerify,
            height: 46,
            backgroundColor: purple700,
            radius: 23,
            isUppercase: true,
            text: 'Verify',
          ),
          const SizedBox(
            height: 18,
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
      ),
    );
  }
}
