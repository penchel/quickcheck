import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  final Icon icon;
  final double buttonSize;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;

  const FlutterFlowIconButton({
    super.key,
    required this.icon,
    this.buttonSize = 50.0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: const Color(0xFF05B9FA),
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor!,
          width: borderWidth,
        ),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
