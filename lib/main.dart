import 'package:flutter/material.dart';   // Google style
// import 'package:flutter/cupertino.dart';   // Apple style
import 'package:quickcheck/features/profile/register_page.dart';    // redirect

void main() => runApp(const MyApp()); // Start App

class MyApp extends StatelessWidget {   // Extends from a fixed class of states
  const MyApp({super.key});   // unique identification of a widget - const optimizes
  @override   // inherited function

  Widget build(BuildContext context) {    // create the widget
    return const MaterialApp(
      debugShowCheckedModeBanner: false,    // remove the band
      home: RegisterPage(),
    );
  }
}


