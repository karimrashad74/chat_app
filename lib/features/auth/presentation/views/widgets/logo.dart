import 'package:chat/core/constants/asset_images.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        Assets.assetsImagesWhatsaAppLogo,
        width: 300,
        height: 250,
      ),
    );
  }
}
