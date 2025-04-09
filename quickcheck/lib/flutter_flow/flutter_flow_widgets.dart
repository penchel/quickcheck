import 'package:flutter/material.dart';

class FFButtonOptions {
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry iconPadding;
  final Color color;
  final TextStyle textStyle;
  final double elevation;
  final double borderRadius;

  const FFButtonOptions({
    this.width = 130,
    this.height = 40,
    this.padding = const EdgeInsets.all(8),
    this.iconPadding = const EdgeInsets.all(0),
    this.color = Colors.blue,
    required this.textStyle,
    this.elevation = 2.0,
    this.borderRadius = 8.0,
  });
}

class FFButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final FFButtonOptions options;

  const FFButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: options.color,
      elevation: options.elevation,
      padding: options.padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(options.borderRadius),
      ),
      child: Container(
        width: options.width,
        height: options.height,
        alignment: Alignment.center,
        child: Text(
          text,
          style: options.textStyle,
        ),
      ),
    );
  }
}
