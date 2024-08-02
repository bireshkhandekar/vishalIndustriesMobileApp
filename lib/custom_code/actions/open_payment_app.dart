// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<void> openPaymentApp() async {
  const googlePayPackage = 'com.google.android.apps.nbu.paisa.user';
  const phonePePackage = 'com.phonepe.app';

  bool googlePayInstalled = await canLaunch('upi://pay?pa=$googlePayPackage');
  bool phonePeInstalled = await canLaunch('upi://pay?pa=$phonePePackage');

  if (googlePayInstalled) {
    await launch('upi://pay?pa=$googlePayPackage');
  } else if (phonePeInstalled) {
    await launch('upi://pay?pa=$phonePePackage');
  } else {
    throw 'Neither Google Pay nor PhonePe is installed';
  }
}
