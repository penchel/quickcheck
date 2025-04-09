import 'dart:core';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  static String routeName = 'LoginPage';
  static String routePath = '/loginPage';

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF05B9FA),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quickcheck-lx2761/assets/gorap6sfa8ro/fotocamera.png',
                    width: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 200.0;
                      } else if (MediaQuery.sizeOf(context).width < 1440.0) {
                        return 550.0;
                      } else {
                        return 400.0;
                      }
                    }(),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'QuickCheck',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                    fontFamily: 'Noto Sans',
                    fontSize: () {
                      if (MediaQuery.sizeOf(context).width <
                          kBreakpointSmall) {
                        return 50.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 50.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 70.0;
                      } else {
                        return 80.0;
                      }
                    }(),
                    letterSpacing: 0.0,
                    useGoogleFonts:
                    GoogleFonts.asMap().containsKey('Noto Sans'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
