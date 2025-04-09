// lib/flutter_flow/flutter_flow_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => FlutterFlowTheme();

  // Text styles
  TextStyle get displayLarge => GoogleFonts.notoSans(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );

  TextStyle get labelMedium => GoogleFonts.notoSans(
    color: Colors.grey[800],
    fontSize: 14,
  );

  String get labelMediumFamily => 'Noto Sans';

  TextStyle get bodyMedium => GoogleFonts.notoSans(
    color: Colors.black87,
    fontSize: 16,
  );

  String get bodyMediumFamily => 'Noto Sans';

  // Colors
  Color get error => Colors.red;
  Color get secondaryBackground => Colors.white;
  Color get primaryText => Colors.black;
}

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
