import 'package:flutter/material.dart';
import 'package:shop_app_flutter/components/default_button.dart';
import 'package:shop_app_flutter/constants.dart';
import 'package:shop_app_flutter/screens/splash/components/splash_content.dart';
import 'package:shop_app_flutter/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":"Welcome to Tokoto, Let's shop!",
      "image":"assets/images/splash_1.png"
    },
    {
      "text":"We help people conect with stores \naround Cameroon",
      "image":"assets/images/splash_2.png"
    },
    {
      "text":"We show the easy way to shop. \nJust stay at home with us",
      "image":"assets/images/splash_3.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                onPageChanged: (page){
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (context, index){
                  Map<String, String> data = splashData[index];
                  return SplashContent(
                    text: data['text'],
                    image: data['image'],
                  );
                }
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index)
                      ),
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Spacer(flex: 2,),
                    DefaultButton(
                      text: 'Continue',
                      press: (){},
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}){
    return AnimatedContainer(
      duration: KAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }
}






