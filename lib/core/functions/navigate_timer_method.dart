import 'dart:async';
import 'package:flutter/material.dart';

void customNavigateTimer(
    BuildContext context, int navigateTime, Widget screenName) {
  Timer(Duration(seconds: navigateTime), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screenName),
    );
  });
}
