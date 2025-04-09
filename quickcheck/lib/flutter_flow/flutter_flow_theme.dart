import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => FlutterFlowTheme();

  // Estilo de texto principal da tela (como o título "QuickCheck")
  TextStyle get displayLarge => GoogleFonts.notoSans(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );

// Aqui você pode adicionar mais estilos conforme for usando
// Ex: titleSmall, bodyMedium, labelLarge, etc.
}

/// Extensão para permitir usar `.override(...)` igual no FlutterFlow
extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextDecoration? decoration,
    bool useGoogleFonts = true,
  }) {
    return (useGoogleFonts && fontFamily != null)
        ? GoogleFonts.getFont(
      fontFamily,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      decoration: decoration ?? this.decoration,
    )
        : this.copyWith(
      fontFamily: fontFamily ?? this.fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }
}
