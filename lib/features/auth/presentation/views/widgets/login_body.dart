import 'package:chat/core/functions/navigate_replacment_method.dart';
import 'package:chat/features/auth/presentation/views/widgets/email_feild.dart';
import 'package:chat/features/auth/presentation/views/widgets/login_button.dart';
import 'package:chat/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chat/features/auth/presentation/views/widgets/logo.dart';
import 'package:chat/features/auth/presentation/views/widgets/password_feild.dart';
import 'package:chat/features/auth/presentation/views/widgets/register_row.dart';
import 'package:chat/features/home/presentaton/views/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  final formKey = GlobalKey<FormState>();

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
                const LogoWidget(),
                const SizedBox(height: 20),
                const LoginTitle(),
                const SizedBox(height: 20),
                EmailField(emailController: emailController),
                const SizedBox(height: 15),
                PasswordField(
                  passwordController: passwordController,
                  isPasswordVisible: isPasswordVisible,
                  toggleVisibility: () {
                    isPasswordVisible = !isPasswordVisible;
                  },
                ),
                const SizedBox(height: 20),
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  onSuccess: () {
                    navigateReplacement(context, const BottomNavBar());
                  },
                ),
                const SizedBox(height: 20),
                const RegisterRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }

  SnackBar customSnackBar({required String message}) {
    return SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 40,
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
