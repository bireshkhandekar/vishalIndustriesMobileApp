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
import 'dart:convert';
import 'package:razorpay_flutter/razorpay_flutter.dart';

Future<dynamic> razorpayaction(
  BuildContext context,
  double amount,
  String name,
  String description,
  String contact,
) async {
  // Add your function code here!
  Completer<Map<String, dynamic>> completer = Completer<Map<String, dynamic>>();

  Razorpay _razorpay = Razorpay();

  // Configure payment options
  Map<String, dynamic> options = {
    'key': 'rzp_test_Kxza7X4UMAMLKH',
    'amount':
        amount * 100, // amount in the smallest currency unit (e.g., cents)
    'name': name,
    'description': description,
    'prefill': {
      'contact': contact
      //'email':'customer@example.com', // This can also be passed as a parameter if needed
    },
    'external': {
      'wallets': ['paytm']
    }
  };

  // Handle payment success and failure
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
      (PaymentSuccessResponse response) {
    // Payment success logic
    print("Payment Successful: ${response}");

    Map<String, dynamic> paymentResponse = {
      'status': 'success',
      'paymentId': response.paymentId,
      'orderId': response.orderId,
      //'amount': response.amount,
      'signature': response.signature,
      // Add other details as needed
    };

    completer.complete(paymentResponse);
  });

  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse response) {
    // Payment failure logic
    print("Payment Error: ${response}");

    Map<String, dynamic> paymentResponse = {
      'status': 'error',
      // Add other details as needed
    };

    completer.complete(paymentResponse);
  });

  try {
    _razorpay.open(options);
  } catch (e) {
    print(e.toString());
    Map<String, dynamic> paymentResponse = {
      'status': 'error',
      'errorMessage': e.toString(),
    };
    completer.complete(paymentResponse);
  }

  return completer.future;
}
