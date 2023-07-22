import 'package:flutter/material.dart';
import 'package:news_aoo/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash.png'),
          fit: BoxFit.fill,
        )
      ),
    );
  }
}
