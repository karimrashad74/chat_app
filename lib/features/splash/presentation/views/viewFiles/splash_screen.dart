import 'package:chat/core/constants/asset_images.dart';
import 'package:chat/features/auth/presentation/views/viewFiles/login_screen.dart';
import 'package:chat/features/splash/presentation/views/widgets/navigate_method.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    customNavigateTimer(context, 3, const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          Assets.assetsImagesWhatsaAppLogo,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
