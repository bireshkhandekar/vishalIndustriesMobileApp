import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start VI APIs Group Code

class VIAPIsGroup {
  static String getBaseUrl() => 'http://4.186.24.61:8000';
  static Map<String, String> headers = {};
  static LoginApiCall loginApiCall = LoginApiCall();
  static GetProductCall getProductCall = GetProductCall();
  static GetTagCall getTagCall = GetTagCall();
  static OrderPlaceUPICall orderPlaceUPICall = OrderPlaceUPICall();
  static GetDelearByIdCall getDelearByIdCall = GetDelearByIdCall();
  static UpdateDeliveryAddressCall updateDeliveryAddressCall =
      UpdateDeliveryAddressCall();
  static DeleteAddressByIdCall deleteAddressByIdCall = DeleteAddressByIdCall();
  static OrderByDealerIdCall orderByDealerIdCall = OrderByDealerIdCall();
  static OrderByOrderIdCall orderByOrderIdCall = OrderByOrderIdCall();
  static GetBannersCall getBannersCall = GetBannersCall();
  static ProductSearchCall productSearchCall = ProductSearchCall();
  static GetWishlistsCall getWishlistsCall = GetWishlistsCall();
  static AddWishlistCall addWishlistCall = AddWishlistCall();
  static DeleteWishItemCall deleteWishItemCall = DeleteWishItemCall();
  static OrderCancelCall orderCancelCall = OrderCancelCall();
  static UploadPaymentImageCall uploadPaymentImageCall =
      UploadPaymentImageCall();
}

class LoginApiCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? mpin = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "$username",
  "mpin": "$mpin"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login api',
      apiUrl: '$baseUrl/user/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductCall {
  Future<ApiCallResponse> call({
    String? tagName = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get product',
      apiUrl: '$baseUrl/product/?tag=$tagName',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? products(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetTagCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get tag',
      apiUrl: '$baseUrl/tag/all/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? name(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class OrderPlaceUPICall {
  Future<ApiCallResponse> call({
    int? dealerId,
    int? userId,
    String? orderCreatedBy = '',
    double? orderTotal,
    String? paymentMethod = '',
    dynamic orderItemsJson,
    String? address = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    final orderItems = _serializeJson(orderItemsJson, true);
    final ffApiRequestBody = '''
{
  "dealer_id": $dealerId,
  "user_id": $userId,
  "order_created_by": "$orderCreatedBy",
  "order_total": $orderTotal,
  "payment_method": "$paymentMethod",
  "order_items": $orderItems,
  "delivery": {
    "delivery_address": "$address"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'order place UPI',
      apiUrl: '$baseUrl/order/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDelearByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get delear by id',
      apiUrl: '$baseUrl/dealer/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? deliveryAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.delivery_address''',
        true,
      ) as List?;
}

class UpdateDeliveryAddressCall {
  Future<ApiCallResponse> call({
    String? addLine1 = '',
    String? addLine2 = '',
    String? pincode = '',
    String? city = '',
    String? district = '',
    String? state = '',
    int? id,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "delivery_address": [
    {
      "address_line1": "$addLine1",
      "address_line2": "$addLine2",
      "pin_code": "$pincode",
      "district": "$district",
      "city": "$city",
      "state": "$state"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update delivery address',
      apiUrl: '$baseUrl/dealer/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAddressByIdCall {
  Future<ApiCallResponse> call({
    int? dealerId,
    int? addressId,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete address by id',
      apiUrl: '$baseUrl/dealer/$dealerId/delivery_address/$addressId',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderByDealerIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'order by dealer id',
      apiUrl: '$baseUrl/order/by_dealer/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic orders(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class OrderByOrderIdCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'order by orderId',
      apiUrl: '$baseUrl/order/$orderId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.data.order_items''',
        true,
      ) as List?;
}

class GetBannersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get banners',
      apiUrl: '$baseUrl/banner/all/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? images(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ProductSearchCall {
  Future<ApiCallResponse> call({
    String? product = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Product Search',
      apiUrl: '$baseUrl/tag/search_products/?tag_name=$product',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? product(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetWishlistsCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get wishlists',
      apiUrl: '$baseUrl/wishlist/$userId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? product(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AddWishlistCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? productIds,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": $userId,
  "product_id": $productIds
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'add wishlist',
      apiUrl: '$baseUrl/wishlist/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteWishItemCall {
  Future<ApiCallResponse> call({
    int? productId,
    int? userId,
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete wishItem',
      apiUrl: '$baseUrl/wishlist/$productId/$userId',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderCancelCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? orderStatus = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "order_status": "$orderStatus"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'order cancel',
      apiUrl: '$baseUrl/order/$orderId',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadPaymentImageCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? paymentUrl = '',
  }) async {
    final baseUrl = VIAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "payment_url": [
      ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'upload Payment Image',
      apiUrl: '$baseUrl/order/$orderId',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End VI APIs Group Code

class UploadimgbbCall {
  static Future<ApiCallResponse> call({
    String? key = '',
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'uploadimgbb',
      apiUrl: 'https://api.imgbb.com/1/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'key': key,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PincodeCall {
  static Future<ApiCallResponse> call({
    String? pincode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'pincode',
      apiUrl: 'https://api.postalpincode.in/pincode/$pincode',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$[:].PostOffice[:].State''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? district(dynamic response) => (getJsonField(
        response,
        r'''$[:].PostOffice[:].District''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiCallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'api call',
      apiUrl: 'http://4.186.24.61:8000/docs',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
