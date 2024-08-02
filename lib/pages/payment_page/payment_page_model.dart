import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:flutter/material.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox2 widget.
  bool? checkbox2Value;
  // Stores action output result for [Backend Call - SQLite (getTotalprice)] action in Button widget.
  List<GetTotalpriceRow>? cashgettotalprice;
  // Stores action output result for [Backend Call - SQLite (allget)] action in Button widget.
  List<AllgetRow>? cashAllget;
  // Stores action output result for [Backend Call - API (order place UPI)] action in Button widget.
  ApiCallResponse? apiResultorderplacecash;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
