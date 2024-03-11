import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/alerts/show_alert_place_creation/show_alert_place_creation_widget.dart';
import '/pages/components/empty_list/empty_supermarket_list/empty_supermarket_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());
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
      future: _model.createdListQuery(
        requestFn: () => ListShoppingGroup.getCreatedListByUserCall.call(
          userId: FFAppState().userID,
          authToken: currentAuthenticationToken,
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
        final homeScreenGetCreatedListByUserResponse = snapshot.data!;
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
              title: Align(
                alignment: AlignmentDirectional(
                    valueOrDefault<double>(
                      homeScreenGetCreatedListByUserResponse.bodyText != '[]'
                          ? 0.0
                          : 0.2,
                      0.0,
                    ),
                    0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('LoginScreen', context.mounted);
                  },
                  child: Text(
                    'Principal',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              actions: [
                Visibility(
                  visible:
                      homeScreenGetCreatedListByUserResponse.bodyText != '[]',
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
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
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const SizedBox(
                                    height: 170.0,
                                    width: 350.0,
                                    child: ShowAlertPlaceCreationWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: const Icon(
                          Icons.add_circle_outline,
                          color: Color(0xC21E00FF),
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: Builder(
              builder: (context) {
                final listaCriadas = getJsonField(
                  homeScreenGetCreatedListByUserResponse.jsonBody,
                  r'''$''',
                ).toList();
                if (listaCriadas.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: const EmptySupermarketListWidget(),
                    ),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      List.generate(listaCriadas.length, (listaCriadasIndex) {
                    final listaCriadasItem = listaCriadas[listaCriadasIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                getJsonField(
                                  listaCriadasItem,
                                  r'''$.nameList''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
