import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'useraddress_page_widget.dart' show UseraddressPageWidget;
import 'package:flutter/material.dart';

class UseraddressPageModel extends FlutterFlowModel<UseraddressPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (delete address by id)] action in Icon widget.
  ApiCallResponse? apiResultdeleteaddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
