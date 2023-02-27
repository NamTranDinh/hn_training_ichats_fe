import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/config/validator/validators.dart';
import 'package:i_chat/src/presentation/cubiT/otp/otp_cubit.dart';
import 'package:i_chat/src/presentation/widgets/drawable/email_form_field.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../drawable/button_text.dart';

class Body extends StatefulWidget {
  var emailController = TextEditingController();

  Body({Key? key, required this.emailController}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  void onSubmitRecoverPassword() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<OtpCubit>(context)
          .onSubmitSentOtp(widget.emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 56),
          EmailFormField(
            controller: widget.emailController,
            onChanged: (value) {
              value = widget.emailController.text;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !Validators.isEmailValid(value)) {
                return 'Email invalid!';
              }
              return null;
            },
            styleOutLineEmail: StyleOutLineEmail.outlineInputBorder,
            borderColor: purple900,
            textInputAction: TextInputAction.done,
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 8),
          ButtonText(
            onPressed: onSubmitRecoverPassword,
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
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
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
