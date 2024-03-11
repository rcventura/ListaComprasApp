import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'product_list_screen_widget.dart' show ProductListScreenWidget;
import 'package:flutter/material.dart';

class ProductListScreenModel extends FlutterFlowModel<ProductListScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Query cache managers for this widget.

  final _listItemsCategoryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> listItemsCategory({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _listItemsCategoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListItemsCategoryCache() => _listItemsCategoryManager.clear();
  void clearListItemsCategoryCacheKey(String? uniqueKey) =>
      _listItemsCategoryManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearListItemsCategoryCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
