import 'package:chat/core/constants/asset_images.dart';
import 'package:chat/core/functions/navigate_timer_method.dart';
import 'package:chat/core/themes/styles.dart';
import 'package:chat/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    customNavigateTimer(context, 3, const LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesWhatsaAppLogo,
            ),
            Text(
              'The Best Chat App Of Ths Century',
              style: Styles.textStyle24,
            ),
          ],
        ),
      ),
    );
  }
}
