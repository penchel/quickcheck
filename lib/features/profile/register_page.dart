import 'package:flutter/material.dart';
import 'package:quickcheck/app/profile/theme_register.dart';   // decoration
import 'package:quickcheck/features/profile/login_page.dart'; // redirecting

import 'package:quickcheck/data/profile/user.dart';   // data
import 'package:quickcheck/data/isar_service.dart';  // control data




class RegisterPage extends StatefulWidget {    // Extends from a not fixed class of states
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();  // create a state
}

class _RegisterPageState extends State<RegisterPage> {    // customize the state

  final TextEditingController _userController = TextEditingController();   // controls the text field
  final TextEditingController _passwordController = TextEditingController();   // "_" It's a private name
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),   // bar with fixed text
      body: SingleChildScrollView(    // allows the screen to scroll because the keyboard is large
        padding: const EdgeInsets.all(16.0),    // add spacing
        child: Column(    // arrange one under the other
          children: [

            TextField(
              controller: _userController,   // allows capture
              decoration: RegisterTheme.inputDecoration.copyWith(labelText: 'Usuário'),   // add details
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cpfController,
              decoration: RegisterTheme.inputDecoration.copyWith(labelText: 'CPF'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: RegisterTheme.inputDecoration.copyWith(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _institutionController,
              decoration: RegisterTheme.inputDecoration.copyWith(labelText: 'CNPJ Instituição'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: RegisterTheme.inputDecoration.copyWith(labelText: 'Senha'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: RegisterTheme.buttonStyle,
              onPressed: _makeRegister,
              child: const Text('Cadastrar'),
            ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text('Já tem login? Entrar'),
            ),

          ],
        ),
      ),
    );
  }

  void _makeRegister() async {
    final username = _userController.text;
    final password = _passwordController.text;
    final cpf =  _cpfController.text;
    final email = _emailController.text;
    final institution = _institutionController.text;

    final newUser = User()
      ..username = username
      ..password = password
      ..cpf = cpf
      ..email = email
      ..institution = institution;

    final isar = await IsarService.getIsarInstance();
    await isar.writeTxn(() async {
      await isar.users.put(newUser);
    });

    _userController.clear();
    _passwordController.clear();
    _cpfController.clear();
    _emailController.clear();
    _institutionController.clear();

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }
}
