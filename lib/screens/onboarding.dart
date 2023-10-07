import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:vnbweb/screens/home_mobile.dart';
import 'package:vnbweb/screens/main.dart';

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      titleTextStyle: TextStyle(
          color: Color(0xFFE040FB), fontSize: 40, fontWeight: FontWeight.w900),
      title: 'On Spot Energy',
      subTitle: 'Get it where you are.',
      imageUrl: 'assets/images/1-1.png',
    ),
    Introduction(
      titleTextStyle: TextStyle(
          color: Color(0xFFE040FB), fontSize: 40, fontWeight: FontWeight.w900),
      title: 'Get it Delivered fast.',
      subTitle: 'Your order will be immediately delivered.',
      imageUrl: 'assets/images/2-2.png',
    ),
    Introduction(
      titleTextStyle: TextStyle(
          color: Colors.purpleAccent,
          fontSize: 40,
          fontWeight: FontWeight.w900),
      title: 'Power your devices',
      subTitle: 'Our tech provides support for multiple kinds on appliances',
      imageUrl: 'assets/images/3-3.png',
    ),
    Introduction(
      titleTextStyle: TextStyle(
          color: Color(0xFFE040FB), fontSize: 40, fontWeight: FontWeight.w900),
      title: 'Finish',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/4-4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      foregroundColor: Colors.purpleAccent,
      backgroudColor: Colors.white,
      introductionList: list,
      skipTextStyle: TextStyle(
        color: Colors.purpleAccent,
      ),
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}
