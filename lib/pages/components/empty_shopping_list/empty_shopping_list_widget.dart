import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_shopping_list_model.dart';
export 'empty_shopping_list_model.dart';

class EmptyShoppingListWidget extends StatefulWidget {
  const EmptyShoppingListWidget({super.key});

  @override
  State<EmptyShoppingListWidget> createState() =>
      _EmptyShoppingListWidgetState();
}

class _EmptyShoppingListWidgetState extends State<EmptyShoppingListWidget> {
  late EmptyShoppingListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyShoppingListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            'Você não tem nenhuma lista de compras criada',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            'Crie sua primeira lista de compras.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).lightGray,
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: const Text('o'),
                    content: const Text('k'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: Color(0xC21E00FF),
              size: 30.0,
            ),
          ),
        ].divide(const SizedBox(height: 20.0)),
      ),
    );
  }
}
