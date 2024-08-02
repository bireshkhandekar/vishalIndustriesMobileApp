import '/backend/api_requests/api_calls.dart';
import '/components/navbar_widget.dart';
import '/components/productloading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:flutter/material.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - handleApiTimeout] action in productPage widget.
  dynamic apiTimeout;
  // Stores action output result for [Backend Call - API (add wishlist)] action in IconButton widget.
  ApiCallResponse? apiResultb6e;
  // Model for productloading component.
  late ProductloadingModel productloadingModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    productloadingModel = createModel(context, () => ProductloadingModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    productloadingModel.dispose();
    navbarModel.dispose();
  }
}
