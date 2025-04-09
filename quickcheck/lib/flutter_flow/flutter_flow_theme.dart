import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => FlutterFlowTheme();

  // Text styles
  TextStyle get displayLarge => GoogleFonts.notoSans(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 40,
    shadows: [
      const Shadow(
        color: Colors.black54,
        offset: Offset(2, 2),
        blurRadius: 4,
      ),
    ],
  );

  TextStyle get labelMedium => GoogleFonts.notoSans(
    color: Colors.grey[800],
    fontSize: 14,
    shadows: [
      const Shadow(
        color: Colors.black12,
        offset: Offset(1, 1),
        blurRadius: 1,
      ),
    ],
  );

  String get labelMediumFamily => 'Noto Sans';

  TextStyle get bodyMedium => GoogleFonts.notoSans(
    color: Colors.black87,
    fontSize: 16,
    shadows: [
      const Shadow(
        color: Colors.grey,
        offset: Offset(1, 1),
        blurRadius: 2,
      ),
    ],
  );

  String get bodyMediumFamily => 'Noto Sans';

  // New TextStyle
  TextStyle get headlineMedium => GoogleFonts.notoSans(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    shadows: [
      const Shadow(
        color: Colors.black26,
        offset: Offset(1.0, 1.0),
        blurRadius: 1.0,
      ),
    ],
  );

  // Colors
  Color get error => Colors.red;
  Color get secondaryBackground => Colors.white;
  Color get primaryText => Colors.black;

  // New Colors
  Color get primaryBackground => Colors.blue; // Background azul
  Color get secondaryText => Colors.grey;

  FaIcon get defaultIcon => FaIcon(
    FontAwesomeIcons.star,
    color: primaryText,
    size: 24,
  );
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
    List<Shadow>? shadows,
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
      shadows: shadows ?? this.shadows,
    )
        : copyWith(
      fontFamily: fontFamily ?? this.fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
