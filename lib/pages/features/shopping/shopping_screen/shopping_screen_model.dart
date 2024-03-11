import '/flutter_flow/flutter_flow_util.dart';
import 'shopping_screen_widget.dart' show ShoppingScreenWidget;
import 'package:flutter/material.dart';

class ShoppingScreenModel extends FlutterFlowModel<ShoppingScreenWidget> {
  ///  Local state fields for this page.

  bool listCreated = false;

  String listName = '-';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListNameTextField widget.
  FocusNode? listNameTextFieldFocusNode;
  TextEditingController? listNameTextFieldController;
  String? Function(BuildContext, String?)? listNameTextFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    listNameTextFieldFocusNode?.dispose();
    listNameTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
