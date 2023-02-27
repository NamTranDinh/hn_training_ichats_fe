import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/config/theme/app_color.dart';
import 'package:i_chat/src/config/validator/validators.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/presentation/cubiT/credential/credential_cubit.dart';
import 'package:i_chat/src/presentation/widgets/drawable/button_text.dart';
import 'package:i_chat/src/presentation/widgets/drawable/email_form_field.dart';
import 'package:i_chat/src/presentation/widgets/drawable/password_form_text.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var rePassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _form();
  }

  void _onSubmitSignUp() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<CredentialCubit>(context).onSubmitSignUp(
          userEntity: UserEntity(
        userId: '',
        userName: userNameController.text.trim(),
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
            controller: userNameController,
            onChanged: (value) {
              value = emailController.text;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !Validators.isUserNameValid(value)) {
                return 'User name invalid!';
              }
              return null;
            },
            autoValidateMode: AutovalidateMode.onUserInteraction,
            styleOutLineEmail: StyleOutLineEmail.outlineInputBorder,
            borderColor: purple900,
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.person,
            labelText: 'User name',
          ),
          const SizedBox(height: 8),
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
            controller: passController,
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
            autoValidateMode: AutovalidateMode.onUserInteraction,
            styleOutLinePass: StyleOutLinePass.outlineInputBorder,
            borderColor: purple900,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          PasswordFormField(
            controller: rePassController,
            onChanged: (value) {
              value = rePassController.text;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != rePassController.text) {
                return 'Re-enter the password does not match!';
              }
              return null;
            },
            autoValidateMode: AutovalidateMode.onUserInteraction,
            styleOutLinePass: StyleOutLinePass.outlineInputBorder,
            borderColor: purple900,
            labelText: 'Re-password',
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 12),
          ButtonText(
            onPressed: _onSubmitSignUp,
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
