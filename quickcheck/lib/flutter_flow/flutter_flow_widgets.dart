import 'package:flutter/material.dart';

// Placeholder para widgets personalizados do FlutterFlow
// Crie componentes customizados aqui se o LoginPage precisar

// Exemplo: um botão estilizado (caso use em outras páginas depois)
class FFButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

  const FFButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textStyle = const TextStyle(color: Colors.white),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
