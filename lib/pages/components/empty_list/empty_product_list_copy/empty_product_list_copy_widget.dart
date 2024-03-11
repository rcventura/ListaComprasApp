import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_product_list_copy_model.dart';
export 'empty_product_list_copy_model.dart';

class EmptyProductListCopyWidget extends StatefulWidget {
  const EmptyProductListCopyWidget({super.key});

  @override
  State<EmptyProductListCopyWidget> createState() =>
      _EmptyProductListCopyWidgetState();
}

class _EmptyProductListCopyWidgetState
    extends State<EmptyProductListCopyWidget> {
  late EmptyProductListCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyProductListCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nenhum item na sua lista de compras',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            'Adicione seu primeiro item',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).lightGray,
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ].divide(const SizedBox(height: 20.0)),
      ),
    );
  }
}
