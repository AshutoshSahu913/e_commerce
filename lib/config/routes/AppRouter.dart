import 'package:e_commerce/config/routes/RoutesName.dart';
import 'package:e_commerce/screens/signup/SignUpScreen.dart';
import 'package:e_commerce/screens/welcome/WelcomeScreen.dart';
import 'package:flutter/material.dart';

import '../../screens/home/HomePage.dart';
import '../../screens/splash/SplashScreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
