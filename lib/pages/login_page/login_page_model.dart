import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkInternetConnection] action in login_page widget.
  bool? connectionResult;
  // State field(s) for usernameTextField widget.
  FocusNode? usernameTextFieldFocusNode;
  TextEditingController? usernameTextFieldTextController;
  String? Function(BuildContext, String?)?
      usernameTextFieldTextControllerValidator;
  String? _usernameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Username / Contact Number';
    }

    if (val.length < 10) {
      return 'Enter 10 digit Username / Contact Number';
    }
    if (val.length > 10) {
      return 'Enter 10 digit Username / Contact Number';
    }

    return null;
  }

  // State field(s) for MPINTextField widget.
  FocusNode? mPINTextFieldFocusNode;
  TextEditingController? mPINTextFieldTextController;
  late bool mPINTextFieldVisibility;
  String? Function(BuildContext, String?)? mPINTextFieldTextControllerValidator;
  String? _mPINTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter MPIN';
    }

    if (val.length < 6) {
      return 'Enter 6 digit MPIN';
    }
    if (val.length > 6) {
      return 'Enter 6 digit MPIN';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (login api)] action in LoginButton widget.
  ApiCallResponse? apiResultlogin;

  @override
  void initState(BuildContext context) {
    usernameTextFieldTextControllerValidator =
        _usernameTextFieldTextControllerValidator;
    mPINTextFieldVisibility = false;
    mPINTextFieldTextControllerValidator =
        _mPINTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameTextFieldFocusNode?.dispose();
    usernameTextFieldTextController?.dispose();

    mPINTextFieldFocusNode?.dispose();
    mPINTextFieldTextController?.dispose();
  }
}
