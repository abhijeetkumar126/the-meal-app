import 'package:flutter/material.dart';
import 'package:themealdb_app/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Exo2',
        // fontFamily: 'Playwrite',
        // fontFamily: 'Playwrite-cu',
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
    );
  }
}
