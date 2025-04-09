import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_utils_turma.dart';
import 'presenca_page_model.dart';
export 'presenca_page_model.dart';

class TurmasWidget extends StatefulWidget {
  const TurmasWidget({super.key});

  static String routeName = 'turmas';
  static String routePath = '/turmas';

  @override
  State<TurmasWidget> createState() => _TurmasWidgetState();
}

class _TurmasWidgetState extends State<TurmasWidget> {
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
    // Dimensão total da tela
    double screenWidth = MediaQuery.of(context).size.width;
    // Para duas colunas: descontamos o padding horizontal (16+16) e o spacing entre as caixas (16)
    double boxWidth = (screenWidth - 48) / 2;

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
            child: Padding(
              // Espaço entre as bordas e o conteúdo
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16.0,  // Espaço horizontal entre as caixas
                runSpacing: 16.0,  // Espaço vertical entre as caixas
                children: [
                  // Caixa 1
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: boxWidth,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('8° Ano - Matemática',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                          Text('10h - 12h',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                          Text('Segunda e Terça',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                        ],
                      ),
                    ),
                  ),
                  // Caixa 2
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: boxWidth,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('9° Ano - Física',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                          Text('13h - 15h',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                          Text('Quarta e Sexta',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                        ],
                      ),
                    ),
                  ),
                  // Caixa 3
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: boxWidth,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('7° Ano - Química',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                          Text('08h - 10h',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                          Text('Terça e Quinta',
                              style: FlutterFlowTheme.of(context).bodyMedium),
                        ],
                      ),
                    ),
                  ),
                  // Botão de adicionar turma (estático)
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: boxWidth,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.plus,
                          size: 30,
                          color: Colors.black,
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
