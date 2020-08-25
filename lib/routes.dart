import 'package:flutter/widgets.dart';
import 'package:shop_app_flutter/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app_flutter/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  SignInScreen.routeName : (context) => SignInScreen(),
};