import '/backend/sqlite/sqlite_manager.dart';
import '/components/cart_componet_widget.dart';
import '/components/cart_empty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for cartComponet dynamic component.
  late FlutterFlowDynamicModels<CartComponetModel> cartComponetModels;
  // Model for cartEmpty component.
  late CartEmptyModel cartEmptyModel;
  // Stores action output result for [Backend Call - SQLite (getTotalprice)] action in Button widget.
  List<GetTotalpriceRow>? getTotalprice;
  // Stores action output result for [Custom Action - checkCartTotalAmountnull] action in Button widget.
  bool? actionresult;

  @override
  void initState(BuildContext context) {
    cartComponetModels = FlutterFlowDynamicModels(() => CartComponetModel());
    cartEmptyModel = createModel(context, () => CartEmptyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartComponetModels.dispose();
    cartEmptyModel.dispose();
  }
}
