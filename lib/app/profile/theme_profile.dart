import 'package:flutter/material.dart';

class ProfileTheme {
  // Título dos campos
  static const labelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  // Valor dos campos
  static const valueStyle = TextStyle(
    fontSize: 18,
    color: Colors.black87,
  );

  // Espaçamento entre os itens
  static const fieldSpacing = SizedBox(height: 8);

  // Padding da página
  static const contentPadding = EdgeInsets.all(16.0);

  // Gera um campo com label + valor
  static Widget field(String label, String value) {
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: labelStyle,
        children: [
          TextSpan(
            text: value,
            style: valueStyle,
          ),
        ],
      ),
    );
  }
}
