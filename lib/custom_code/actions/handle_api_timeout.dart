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

import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> handleApiTimeout(
    BuildContext context, String apiUrl, int timeoutSeconds) async {
  try {
    final response = await http
        .get(Uri.parse(apiUrl))
        .timeout(Duration(seconds: timeoutSeconds));

    if (response.statusCode == 200) {
      return {'success': true, 'data': json.decode(response.body)};
    } else {
      return {'success': false, 'error': 'Error: ${response.statusCode}'};
    }
  } on TimeoutException catch (e) {
    return {'success': false, 'error': 'Request timed out'};
  } catch (e) {
    return {'success': false, 'error': 'An error occurred: $e'};
  }
}
