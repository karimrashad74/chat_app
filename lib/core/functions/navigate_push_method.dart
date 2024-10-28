import 'package:flutter/material.dart';

void navigatePush(BuildContext context, Widget screenName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screenName,
    ),
  );
}
