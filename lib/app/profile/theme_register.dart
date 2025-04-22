import 'package:flutter/material.dart';

class RegisterTheme {

  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  );

  static const inputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
  );
}
