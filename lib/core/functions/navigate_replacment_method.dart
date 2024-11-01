import 'package:flutter/material.dart';

void navigateReplacement(BuildContext context, Widget screenName) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screenName,
    ),
  );
}
