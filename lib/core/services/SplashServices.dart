import 'package:e_commerce/config/routes/RoutesName.dart';
import 'package:flutter/material.dart';

class SplashService {
  Future<void> startSplashTimer(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
  }
}
