import 'package:flutter/material.dart';
import 'flutter_flow_model.dart';

T createModel<T extends FlutterFlowModel>(BuildContext context, T Function() modelBuilder) {
  final model = modelBuilder();
  model.initState(context);
  return model;
}
