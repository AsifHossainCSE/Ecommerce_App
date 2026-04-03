import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings setting){
    Widget widget = SizedBox();
    if(setting.name == SplashScreen.name){
      widget = const SplashScreen();
    }

    return MaterialPageRoute(builder: (context) => widget);
  }
}