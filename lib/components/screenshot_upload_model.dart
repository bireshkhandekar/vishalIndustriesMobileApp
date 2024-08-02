import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'screenshot_upload_widget.dart' show ScreenshotUploadWidget;
import 'package:flutter/material.dart';

class ScreenshotUploadModel extends FlutterFlowModel<ScreenshotUploadWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadimgbb)] action in Container widget.
  ApiCallResponse? apiResultuploaded;
  // Stores action output result for [Backend Call - API (upload Payment Image)] action in Button widget.
  ApiCallResponse? apiResult9hl;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
