import '/backend/api_requests/api_calls.dart';
import '/components/productloading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wish_list_page_widget.dart' show WishListPageWidget;
import 'package:flutter/material.dart';

class WishListPageModel extends FlutterFlowModel<WishListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - handleApiTimeout] action in WishListPage widget.
  dynamic apiTimeout;
  // Stores action output result for [Backend Call - API (delete wishItem)] action in IconButton widget.
  ApiCallResponse? apiResultp9y;
  // Model for productloading component.
  late ProductloadingModel productloadingModel;

  @override
  void initState(BuildContext context) {
    productloadingModel = createModel(context, () => ProductloadingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    productloadingModel.dispose();
  }
}
