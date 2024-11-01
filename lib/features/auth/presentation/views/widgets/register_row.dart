import 'package:chat/core/functions/navigate_push_method.dart';
import 'package:chat/core/themes/styles.dart';
import 'package:chat/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            navigatePush(context, const SignUpView());
          },
          child: Text(
            'Register here',
            style: Styles.textStyle10,
          ),
        ),
      ],
    );
  }
}
