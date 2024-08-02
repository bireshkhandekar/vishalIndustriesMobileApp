import '/components/home_loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_loading_widget.dart' show ProductLoadingWidget;
import 'package:flutter/material.dart';

class ProductLoadingModel extends FlutterFlowModel<ProductLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for homeLoading component.
  late HomeLoadingModel homeLoadingModel;

  @override
  void initState(BuildContext context) {
    homeLoadingModel = createModel(context, () => HomeLoadingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    homeLoadingModel.dispose();
  }
}
