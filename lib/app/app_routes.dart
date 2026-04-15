import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:crafty_bay/features/product/presentation/Screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings setting){
    late Widget widget = SizedBox();
    if(setting.name == SplashScreen.name){
      widget = const SplashScreen();
    } else if(setting.name == SignUpScreen.name){
      widget = const SignUpScreen();
    } else if(setting.name == SignInScreen.name){
      widget = const SignInScreen();
    } else if(setting.name == VerifyOtpScreen.name){
      widget = const VerifyOtpScreen();
    } else if(setting.name == MainNavHolderScreen.name){
      widget = const MainNavHolderScreen();
    } else if(setting.name == '/product-list-by-category'){
      widget = const ProductListByCategoryScreen();
    }
     return MaterialPageRoute(builder: (context) => widget);

     
  }
}