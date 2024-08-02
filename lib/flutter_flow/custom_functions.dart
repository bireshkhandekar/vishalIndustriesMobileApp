import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/custom_auth/auth_util.dart';

bool paymentCondition(String status) {
  if (status == 'success') {
    return true;
  } else {
    return false;
  }
}

List<dynamic>? convertToitem(
  List<int> productid,
  List<int> quantity,
  List<String> productname,
  List<double> price,
  List<String> weight,
) {
  List<dynamic> order_items = [];
  for (int i = 0; i < productid.length; i++) {
    Map<String, dynamic> item = {
      'product_id': productid[i],
      'product_name': productname[i],
      'price': price[i],
      'quantity': quantity[i],
      'weight': weight[i]
    };
    order_items.add(item);
  }
  return order_items;
}

String getfistitem(List<String> item) {
  if (item.isEmpty) {
    return '';
  }
  return item[0];
}

List<String> combineaddress(List<dynamic> deliveryAddresses) {
  // convert json to string
  return deliveryAddresses.map((address) {
    return '${address['address_line1']},${address['address_line2']},${address['city']},${address['district']},${address['state']},${address['pin_code']}';
  }).toList();
}

List<dynamic>? listNull(List<dynamic>? list) {
  // hendle null of list
  if (list == null) {
    return [];
  } else {
    return list;
  }
}

int? listindexNull(List<String>? list) {
  // If there is a list and it is null or empty then the index of the list should be 0
  if (list == null || list.isEmpty) {
    return 0;
  } else {
    return list.length;
  }
}
