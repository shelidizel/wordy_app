
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:wordy_app/core/home.dart';
import 'package:wordy_app/core/wordy_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: WordyTheme.light(),
      home:  Splash2(),
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Home(),
      duration: 3,
      text: 'Wordy App',
      textStyle: TextStyle(
        fontSize: 32,
        color: WordyTheme.light().colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      textType: TextType.TyperAnimatedText,
      pageRouteTransition: PageRouteTransition.SlideTransition,
     
    );
  }
}

