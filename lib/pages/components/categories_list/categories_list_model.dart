import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'categories_list_widget.dart' show CategoriesListWidget;
import 'package:flutter/material.dart';

class CategoriesListModel extends FlutterFlowModel<CategoriesListWidget> {
  /// Query cache managers for this widget.

  final _categoryListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> categoryList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _categoryListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryListCache() => _categoryListManager.clear();
  void clearCategoryListCacheKey(String? uniqueKey) =>
      _categoryListManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCategoryListCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
