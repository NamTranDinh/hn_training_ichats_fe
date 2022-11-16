import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/config/theme/app_color.dart';
import 'package:i_chat/src/config/validator/validators.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/presentation/cubiT/credential/credential_cubit.dart';
import 'package:i_chat/src/presentation/widgets/drawable/button_text.dart';
import 'package:i_chat/src/presentation/widgets/drawable/email_form_field.dart';
import 'package:i_chat/src/presentation/widgets/drawable/password_form_text.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _form();
  }

  void _onSubmitSignIn() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<CredentialCubit>(context).onSubmitSignIn(
          userEntity: UserEntity(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      ));
    }
  }

  Widget _form() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          EmailFormField(
            controller: emailController,
            onChanged: (value) {
              value = emailController.text;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !Validators.isEmailValid(value)) {
                return 'Email invalid!';
              }
              return null;
            },
            autoValidateMode: AutovalidateMode.onUserInteraction,
            styleOutLineEmail: StyleOutLineEmail.outlineInputBorder,
            borderColor: purple900,
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 8),
          PasswordFormField(
            onChanged: (value) {
              value = passController.text;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !Validators.isPasswordValid(value)) {
                return 'At least 8 characters, an uppercase letter and number';
              }
              return null;
            },
            styleOutLinePass: StyleOutLinePass.outlineInputBorder,
            borderColor: purple900,
            controller: passController,
            textInputAction: TextInputAction.done,
            autoValidateMode: AutovalidateMode.onUserInteraction,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16.0, top: 6.0, bottom: 4.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteConst.forgotPassRoute);
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 12,
                      color: Colors.deepPurple),
                )),
          ),
          const SizedBox(height: 12),
          ButtonText(
            onPressed: () {
              _onSubmitSignIn();
            },
            // Navigator.pushNamed(context, RouteConst.iChatsRoutes);
            height: 46,
            backgroundColor: purple700,
            radius: 23,
            isUppercase: true,
            text: 'sign in',
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteConst.signupRoute);
              },
              child: const Text(
                'or create an account',
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
