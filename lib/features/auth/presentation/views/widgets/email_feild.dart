import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({required this.emailController, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Enter your email',
        hintText: 'Your email',
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'ُEnter Your E-mail';
        }
        return null;
      },
    );
  }
}
