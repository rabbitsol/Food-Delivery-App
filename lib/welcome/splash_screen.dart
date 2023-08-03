import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/firebase_services/splash_service.dart';
import 'package:fooddeliveryapp/model/app_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashService = SplashService();
  @override
  void initState() {
    super.initState();
    splashService.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppIcons.appicon))),
        ),
      ),
    );
  }
}
