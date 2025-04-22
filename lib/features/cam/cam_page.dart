import 'package:flutter/material.dart';

class CamPage extends StatelessWidget {
  const CamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Câmera')),
      body: const Center(
        child: Text(
          'Câmera',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
