import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Turmas')),
      body: const Center(
        child: Text(
          'Turmas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
