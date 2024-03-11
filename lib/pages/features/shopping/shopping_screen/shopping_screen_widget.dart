import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/alerts/show_alert_delete/show_alert_delete_widget.dart';
import '/pages/components/categories_list/categories_list_widget.dart';
import '/pages/components/empty_list/empty_product_list_copy/empty_product_list_copy_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'shopping_screen_model.dart';
export 'shopping_screen_model.dart';

class ShoppingScreenWidget extends StatefulWidget {
  const ShoppingScreenWidget({super.key});

  @override
  State<ShoppingScreenWidget> createState() => _ShoppingScreenWidgetState();
}

class _ShoppingScreenWidgetState extends State<ShoppingScreenWidget> {
  late ShoppingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingScreenModel());

    _model.listNameTextFieldController ??= TextEditingController();
    _model.listNameTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        floatingActionButton: Visibility(
          visible: _model.listCreated,
          child: Align(
            alignment: const AlignmentDirectional(1.0, 0.7),
            child: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: FlutterFlowTheme.of(context).bGButton,
              elevation: 8.0,
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).borderColor,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.2, 0.0),
            child: Text(
              'Lista de compras',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          actions: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: const SizedBox(
                                height: 170.0,
                                width: 350.0,
                                child: ShowAlertDeleteWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.trashAlt,
                      color: FlutterFlowTheme.of(context).error,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).borderColor,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).borderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_model.listCreated)
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nome da lista',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              functions.upperCaseFirstLetter(_model.listName),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                    Flexible(
                      child: Container(
                        width: 250.0,
                        height: 40.0,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: !_model.listCreated,
                          child: TextFormField(
                            controller: _model.listNameTextFieldController,
                            focusNode: _model.listNameTextFieldFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nome da lista',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                  ),
                              alignLabelWithHint: false,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).bGButton,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).bGButton,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model
                                .listNameTextFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          if (_model.listCreated) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: const CategoriesListWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            setState(() {
                              _model.listCreated = true;
                              _model.listName =
                                  _model.listNameTextFieldController.text;
                            });
                          }
                        },
                        text: _model.listCreated ? 'Novo item' : 'Criar lista',
                        options: FFButtonOptions(
                          height: 30.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).borderColor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF295264),
                                    fontSize: 14.0,
                                  ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).bGButton,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_model.listCreated)
              Expanded(
                child: Builder(
                  builder: (context) {
                    final listaProdutos = FFAppState()
                        .shoppingListProducts
                        .map((e) => getJsonField(
                              e,
                              r'''$''',
                            ))
                        .toList();
                    if (listaProdutos.isEmpty) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: const EmptyProductListCopyWidget(),
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(listaProdutos.length,
                            (listaProdutosIndex) {
                          final listaProdutosItem =
                              listaProdutos[listaProdutosIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getJsonField(
                                        listaProdutosItem,
                                        r'''$.descricao''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).borderColor,
                              ),
                            ].addToStart(const SizedBox(height: 10.0)),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            if (_model.listCreated)
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).borderColor,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).borderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantidade de item: ${valueOrDefault<String>(
                          FFAppState().shoppingListProducts.length.toString(),
                          '0',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      if (!FFAppState().creatingFromHome)
                        Text(
                          'Valor total: R\$ 0.00',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed:
                              !(FFAppState().shoppingListProducts.isNotEmpty)
                                  ? null
                                  : () {
                                      print('Button pressed ...');
                                    },
                          text: 'Salvar lista',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).bGButton,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: const Color(0xFF757F85),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 10.0)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
