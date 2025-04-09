import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({super.key});

  static String routeName = 'RegisterPage';
  static String routePath = '/registerPage';

  @override
  State<RegisterPageWidget> createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Controladores para os campos de texto
  TextEditingController? usernameTextController;
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  TextEditingController? confirmPasswordTextController;

  // FocusNodes para os campos de texto
  FocusNode? usernameFocusNode;
  FocusNode? emailFocusNode;
  FocusNode? passwordFocusNode;
  FocusNode? confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    usernameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();

    usernameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    usernameTextController?.dispose();
    emailTextController?.dispose();
    passwordTextController?.dispose();
    confirmPasswordTextController?.dispose();

    usernameFocusNode?.dispose();
    emailFocusNode?.dispose();
    passwordFocusNode?.dispose();
    confirmPasswordFocusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF05B9FA),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(  // Adicionando SingleChildScrollView
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,  // Adicionando para permitir o conteúdo ser mais flexível
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quickcheck-lx2761/assets/gorap6sfa8ro/fotocamera.png',
                      width: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Register Now',
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: 'Noto Sans',
                        fontSize: 54.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey('Noto Sans'),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      width: 350.0,
                      child: TextFormField(
                        controller: usernameTextController,
                        focusNode: usernameFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Username:',
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      width: 350.0,
                      child: TextFormField(
                        controller: emailTextController,
                        focusNode: emailFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Email:',
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      width: 350.0,
                      child: TextFormField(
                        controller: passwordTextController,
                        focusNode: passwordFocusNode,
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Password:',
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      width: 350.0,
                      child: TextFormField(
                        controller: confirmPasswordTextController,
                        focusNode: confirmPasswordFocusNode,
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Confirm Password:',
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Register button pressed ...');
                    },
                    text: 'Register',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      elevation: 0,
                      borderRadius: 8.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
