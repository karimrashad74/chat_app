import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback toggleVisibility;

  const PasswordField({
    required this.passwordController,
    required this.isPasswordVisible,
    required this.toggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Enter your password',
        hintText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: toggleVisibility,
        ),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is short';
        }
        return null;
      },
    );
  }
}
