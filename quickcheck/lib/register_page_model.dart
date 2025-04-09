import 'package:flutter/material.dart';

class RegisterPageModel {
  // Controladores de texto
  TextEditingController? usernameTextController;
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  TextEditingController? confirmPasswordTextController;

  // Focos de campos
  FocusNode? usernameFocusNode;
  FocusNode? emailFocusNode;
  FocusNode? passwordFocusNode;
  FocusNode? confirmPasswordFocusNode;

  // Função de validação para o nome de usuário
  String? usernameTextControllerValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um nome de usuário.';
    }
    return null;
  }

  // Função de validação para o e-mail
  String? emailTextControllerValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um e-mail.';
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }

  // Função de validação para a senha
  String? passwordTextControllerValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha.';
    }
    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres.';
    }
    return null;
  }

  // Função de validação para a confirmação de senha
  String? confirmPasswordTextControllerValidator(
      BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha.';
    }
    if (value != passwordTextController?.text) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  // Método para limpar os campos
  void dispose() {
    usernameTextController?.dispose();
    emailTextController?.dispose();
    passwordTextController?.dispose();
    confirmPasswordTextController?.dispose();
    usernameFocusNode?.dispose();
    emailFocusNode?.dispose();
    passwordFocusNode?.dispose();
    confirmPasswordFocusNode?.dispose();
  }
}
