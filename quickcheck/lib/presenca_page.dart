import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_utils_turma.dart';
import 'presenca_page_model.dart';
export 'presenca_page_model.dart';

class PresencaWidget extends StatefulWidget {
  const PresencaWidget({super.key});

  static String routeName = 'presenca';
  static String routePath = '/presenca';

  @override
  State<PresencaWidget> createState() => _PresencaWidgetState();
}

class _PresencaWidgetState extends State<PresencaWidget> {
  late PresencaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PresencaModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtendo dimensões da tela
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(), // Sem título na AppBar
          actions: [
            Expanded(
              flex: 1,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.download,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    print("Download pressed");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    print("Photo pressed");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.gear,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    print("Settings pressed");
                  },
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth,
              decoration: const BoxDecoration(

              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Caixa superior (menor)
                  Padding(
                    padding: const EdgeInsets.all(16), // Diminui o padding
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        // Caixa mais curta
                        width: screenWidth * 0.7, // Diminui a largura
                        padding: const EdgeInsets.all(8), // Diminui o padding
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alunos faltantes:',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Lista de 4 nomes aleatórios
                            Text('João', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Maria', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Carlos', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Ana', style: FlutterFlowTheme.of(context).bodyMedium),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Caixa inferior (maior)
                  Padding(
                    padding: const EdgeInsets.all(16), // Diminui o padding
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        // Caixa maior
                        width: screenWidth * 0.7, // Diminui a largura
                        padding: const EdgeInsets.all(8), // Diminui o padding
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Faltas por aluno:',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Lista de 10 nomes aleatórios com número (exemplo)
                            Text('Ricardo: 3', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Fernanda: 1', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Lúcia: 4', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Pedro: 2', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Lucas: 3', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Mariana: 0', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Gabriel: 2', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Sofia: 1', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Rafael: 3', style: FlutterFlowTheme.of(context).bodyMedium),
                            Text('Isabela: 2', style: FlutterFlowTheme.of(context).bodyMedium),
                          ],
                        ),
                      ),
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
