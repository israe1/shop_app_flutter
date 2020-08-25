import 'package:flutter/material.dart';
import 'package:shop_app_flutter/constants.dart';
import 'package:shop_app_flutter/routes.dart';
import 'package:shop_app_flutter/screens/splash/splash_screen.dart';
import 'package:shop_app_flutter/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
//      home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }


}

