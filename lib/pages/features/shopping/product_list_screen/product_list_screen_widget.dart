import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/empty_list/empty_product_list_copy/empty_product_list_copy_widget.dart';
import '/pages/components/empty_list/empty_supermarket_list/empty_supermarket_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_list_screen_model.dart';
export 'product_list_screen_model.dart';

class ProductListScreenWidget extends StatefulWidget {
  const ProductListScreenWidget({
    super.key,
    required this.categoryName,
    this.categoryID,
  });

  final String? categoryName;
  final int? categoryID;

  @override
  State<ProductListScreenWidget> createState() =>
      _ProductListScreenWidgetState();
}

class _ProductListScreenWidgetState extends State<ProductListScreenWidget> {
  late ProductListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: _model.listItemsCategory(
        requestFn: () => CategoriesGroup.getItemsByCategoryCall.call(
          categoriesId: widget.categoryID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final productListScreenGetItemsByCategoryResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).borderColor,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).bGButton,
                  size: 24.0,
                ),
              ),
              title: Align(
                alignment: const AlignmentDirectional(-0.2, 0.0),
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
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: 'Produto',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).borderColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).borderColor,
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
                          suffixIcon: Icon(
                            Icons.search_sharp,
                            color: FlutterFlowTheme.of(context).bGButton,
                            size: 24.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Builder(
                      builder: (context) {
                        final listaProdutos =
                            CategoriesGroup.getItemsByCategoryCall
                                    .itemTitle(
                                      productListScreenGetItemsByCategoryResponse
                                          .jsonBody,
                                    )
                                    ?.toList() ??
                                [];
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState()
                                              .addToShoppingListProducts(<String,
                                                  dynamic>{
                                            'descricao': getJsonField(
                                              listaProdutosItem,
                                              r'''$.itemTitle''',
                                            ),
                                          });
                                          FFAppState()
                                              .addToIndexShoppinglistproducts(<String,
                                                  int>{
                                            widget.categoryID!.toString():
                                                listaProdutosIndex,
                                          });
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Item adicionado na lista com sucesso!',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .bGButton,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 1000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 45.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      listaProdutosItem,
                                                      r'''$.itemTitle''',
                                                    )?.toString(),
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  size: 20.0,
                                                ),
                                              ),
                                              if (!FFAppState()
                                                  .creatingFromHome)
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_right_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    indent: 10.0,
                                    color: FlutterFlowTheme.of(context)
                                        .borderColor,
                                  ),
                                ].addToStart(const SizedBox(height: 10.0)),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final array =
                          FFAppState().indexShoppinglistproducts.toList();
                      if (array.isEmpty) {
                        return const EmptySupermarketListWidget();
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(array.length, (arrayIndex) {
                          final arrayItem = array[arrayIndex];
                          return Text(
                            arrayItem.toString(),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
