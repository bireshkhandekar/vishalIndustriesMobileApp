import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'address_check_model.dart';
export 'address_check_model.dart';

class AddressCheckWidget extends StatefulWidget {
  const AddressCheckWidget({super.key});

  @override
  State<AddressCheckWidget> createState() => _AddressCheckWidgetState();
}

class _AddressCheckWidgetState extends State<AddressCheckWidget> {
  late AddressCheckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressCheckModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
      ),
      child: Checkbox(
        value: _model.checkboxValue ??= false,
        onChanged: (newValue) async {
          setState(() => _model.checkboxValue = newValue!);
        },
        side: BorderSide(
          width: 2,
          color: FlutterFlowTheme.of(context).primaryText,
        ),
        activeColor: FlutterFlowTheme.of(context).primary,
        checkColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
