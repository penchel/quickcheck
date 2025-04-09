// lib/flutter_flow/flutter_flow_theme.dart
import 'package:flutter/material.dart';

class LoginPageModel {
  // Controllers
  TextEditingController? emailTextController;
  TextEditingController? senhaTextController;

  // Focus Nodes
  FocusNode? emailFocusNode;
  FocusNode? senhaFocusNode;

  // Validações (customizável futuramente)
  String? Function(BuildContext, String?) get emailTextControllerValidator =>
          (context, value) => null;

  String? Function(BuildContext, String?) get senhaTextControllerValidator =>
          (context, value) => null;

  void dispose() {
    emailTextController?.dispose();
    senhaTextController?.dispose();
    emailFocusNode?.dispose();
    senhaFocusNode?.dispose();
  }
}

// Função usada no initState
LoginPageModel createModel(
    BuildContext context,
    LoginPageModel Function() modelBuilder,
    ) =>
    modelBuilder();
