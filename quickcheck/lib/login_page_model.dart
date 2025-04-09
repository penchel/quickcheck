import 'package:flutter/material.dart';

class LoginPageModel {
  void initState(BuildContext context) {}

  void dispose() {}
}

LoginPageModel createModel(BuildContext context, LoginPageModel Function() modelBuilder) {
  return modelBuilder();
}
