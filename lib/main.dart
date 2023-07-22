import 'package:flutter/material.dart';
import 'package:news_aoo/home/home_screen.dart';
import 'package:news_aoo/screens/news_details_screen.dart';
import 'package:news_aoo/screens/splash_screen/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 35
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25
          ),
          color: Colors.green,
          centerTitle: true,
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SplashScreen.routeName : (_) => SplashScreen(),
        NewsDetailsScreen.routeName : (_) => NewsDetailsScreen()
      },
    );
  }
}
