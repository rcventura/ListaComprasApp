import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'componentes_model.dart';
export 'componentes_model.dart';

class ComponentesWidget extends StatefulWidget {
  const ComponentesWidget({super.key});

  @override
  State<ComponentesWidget> createState() => _ComponentesWidgetState();
}

class _ComponentesWidgetState extends State<ComponentesWidget> {
  late ComponentesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
