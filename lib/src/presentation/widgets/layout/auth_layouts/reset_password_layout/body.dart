import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/config/validator/validators.dart';
import 'package:i_chat/toast_utils.dart';

import '../../../drawable/button_text.dart';
import '../../../drawable/password_form_text.dart';
import '../../../../../config/theme/app_color.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var passController = TextEditingController();
  var rePassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void onSubmitConfirm() {
    if (formKey.currentState!.validate()) {
      ToastUtils.showToast('Password was change successfully!');
      Navigator.pushNamed(context, RouteConst.signInRoute);
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
          PasswordFormField(
            onChanged: (value) {
              value = passController.text;
            },
            controller: passController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !Validators.isEmailValid(value)) {
                return 'At least 8 characters, an uppercase letter and number';
              }
              return null;
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
              if (value == null ||
                  value.isEmpty ||
                  value != rePassController.text) {
                return 'Re-enter the password does not match!';
              }
              return null;
            },
            styleOutLinePass: StyleOutLinePass.outlineInputBorder,
            borderColor: purple900,
            textInputAction: TextInputAction.done,
            labelText: 'Confirm Password',
          ),
          const SizedBox(height: 8),
          ButtonText(
            onPressed: onSubmitConfirm,
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
      ),
    );
  }
}
