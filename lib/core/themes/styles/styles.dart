import 'package:chat/core/themes/colors/colors_app.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle textStyle24 = const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyle10 = const TextStyle(
    color: ColorsApp.primaryKey,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
