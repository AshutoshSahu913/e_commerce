import 'package:flutter/material.dart';

import '../../core/services/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashService _splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.startSplashTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/images/image1.png",
            width: 240,
            height: 240,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
