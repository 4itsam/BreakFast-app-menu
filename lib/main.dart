import 'package:breakfast/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "BreakFast app",
      debugShowCheckedModeBanner: false,

      theme: textTheme(),

      home: const HomePage(),
    );
  }

  ThemeData textTheme() {
    return ThemeData(
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: "sand",
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          fontFamily: "sand",
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontFamily: "sand",
          fontSize: 21,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontFamily: "sand",
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
