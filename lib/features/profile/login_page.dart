import 'package:flutter/material.dart';   // lib dart
import 'package:quickcheck/app/profile/theme_login.dart';   // decoration
import 'package:quickcheck/features/nav_bar.dart';   // redirecting
import 'package:quickcheck/features/profile/register_page.dart';    // redirecting

import 'package:isar/isar.dart';    // complete package
import 'package:quickcheck/data/isar_service.dart';   // control data
import 'package:quickcheck/data/profile/user.dart';

import '../../data/auth_service.dart';   // table



class LoginPage extends StatefulWidget {    // Extends from a not fixed class of states
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();  // create a state
}

class _LoginPageState extends State<LoginPage> {    // customize the state
  final TextEditingController _cpfController = TextEditingController();   // controls the text field
  final TextEditingController _passwordController = TextEditingController();   // "_" It's a private name

  void _fazerLogin() async {
    final cpf = _cpfController.text;
    final password = _passwordController.text;
    final isar = await IsarService.getIsarInstance();   // object that controls the bank

    final user = await isar.users   // consultation the bank
        .filter()
        .cpfEqualTo(cpf)
        .and()
        .passwordEqualTo(password)
        .findFirst();

    if (user != null) {
      if (!mounted) return;   // make sure it is active
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => NavBar(userCpf: cpf)),    // cpf is passed
      );
      AuthService().login(user.id);
    } else {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Erro de login'),
          content: const Text('CPF ou senha incorretos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    // visual structure
      appBar: AppBar(title: const Text('Login')),   // bar with fixed text
      body: Padding(
        padding: const EdgeInsets.all(16.0),    // add spacing
        child: Column(    // arrange one under the other
          children: [
            TextField(
              controller: _cpfController,   // allows capture
              decoration: LoginTheme.inputDecoration.copyWith(labelText: 'CPF'),   // add details
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: LoginTheme.inputDecoration.copyWith(labelText: 'Senha'),
              obscureText: true,    // hide the typed
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: LoginTheme.buttonStyle,
              onPressed: _fazerLogin,
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 16),

            /*
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                );
              },
              child: const Text('Fazer Registro'),
            ),
            */

          ],
        ),
      ),
    );
  }
}
