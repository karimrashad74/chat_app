import 'package:chat/core/themes/colors_app.dart';
import 'package:flutter/material.dart';

class Massagebutton extends StatelessWidget {
  const Massagebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: ColorApp.primaryColor,
      child: const Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
