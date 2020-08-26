import 'package:flutter/material.dart';
import 'package:shop_app_flutter/components/no_account_text.dart';
import 'package:shop_app_flutter/components/social_card.dart';
import 'package:shop_app_flutter/constants.dart';
import 'package:shop_app_flutter/screens/sign_in/components/sign_form.dart';
import 'package:shop_app_flutter/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04,),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      svgIcon: "assets/icons/google-icon.svg",
                      press: (){},
                    ),
                    SocialCard(
                      svgIcon: "assets/icons/facebook-2.svg",
                      press: (){},
                    ),
                    SocialCard(
                      svgIcon: "assets/icons/twitter.svg",
                      press: (){},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20),),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}









