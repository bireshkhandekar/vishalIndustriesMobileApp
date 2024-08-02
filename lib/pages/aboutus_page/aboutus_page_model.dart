import '/flutter_flow/flutter_flow_util.dart';
import 'aboutus_page_widget.dart' show AboutusPageWidget;
import 'package:flutter/material.dart';

class AboutusPageModel extends FlutterFlowModel<AboutusPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
