import 'package:chat/core/constants/asset_images.dart';
import 'package:chat/core/functions/navigate_push_method.dart';
import 'package:chat/core/functions/navigate_replacment_method.dart';
import 'package:chat/core/shared_widgets/custom_button.dart';
import 'package:chat/core/shared_widgets/text_field.dart';
import 'package:chat/core/themes/styles.dart';
import 'package:chat/features/auth/presentation/views/login_view.dart';
import 'package:chat/features/home/presentaton/views/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPasswordVisible = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    Assets.assetsImagesWhatsaAppLogo,
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  'Create New Account',
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                textField(
                  type: TextInputType.text,
                  controller: nameController,
                  label: 'enter your name',
                  hint: 'your name',
                  prefix: Icons.person,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'name must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                textField(
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'enter your email',
                  hint: 'your email',
                  prefix: Icons.email,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                textField(
                  type: TextInputType.phone,
                  controller: phoneController,
                  label: 'enter your phone',
                  hint: 'your phone',
                  prefix: Icons.phone_android_rounded,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'phone must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                textField(
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                  hint: 'Password',
                  label: 'enter your password',
                  prefix: Icons.lock,
                  suffix: isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  pressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'password is too short';
                    }
                    return null;
                  },
                  isObscure: !isPasswordVisible,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: 'Sign Up',
                  func: () {
                    if (nameController.text.length < 5) {
                      displayToastMssg(
                          'name must be at least 4 characters', context);
                    } else if (!emailController.text.contains('@')) {
                      displayToastMssg('Email address isn\'t valid', context);
                    } else if (phoneController.text.isEmpty) {
                      displayToastMssg('Phone number is mandatory', context);
                    } else if (passwordController.text.length < 8) {
                      displayToastMssg(
                          'Password must be at least 8 characters', context);
                    } else {
                      navigateReplacement(context, const BottomNavBar());
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        navigatePush(context, const LoginView());
                      },
                      child: const Text('Login here'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
