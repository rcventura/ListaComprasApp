import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/alerts/show_alert_place_creation/show_alert_place_creation_widget.dart';
import 'package:flutter/material.dart';
import 'empty_supermarket_list_model.dart';
export 'empty_supermarket_list_model.dart';

class EmptySupermarketListWidget extends StatefulWidget {
  const EmptySupermarketListWidget({super.key});

  @override
  State<EmptySupermarketListWidget> createState() =>
      _EmptySupermarketListWidgetState();
}

class _EmptySupermarketListWidgetState
    extends State<EmptySupermarketListWidget> {
  late EmptySupermarketListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySupermarketListModel());
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
          Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: const SizedBox(
                        height: 250.0,
                        width: 350.0,
                        child: ShowAlertPlaceCreationWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Color(0xC21E00FF),
                size: 30.0,
              ),
            ),
          ),
        ].divide(const SizedBox(height: 20.0)),
      ),
    );
  }
}
