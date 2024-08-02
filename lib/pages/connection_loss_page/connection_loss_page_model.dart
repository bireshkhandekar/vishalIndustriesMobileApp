import '/flutter_flow/flutter_flow_util.dart';
import 'connection_loss_page_widget.dart' show ConnectionLossPageWidget;
import 'package:flutter/material.dart';

class ConnectionLossPageModel
    extends FlutterFlowModel<ConnectionLossPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? resultconnection;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
