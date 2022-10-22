import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inthekloud_shop_app/core/error/exception.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';

class RemoteDataSource {
  static const String baseURL = "https://dummyjson.com/";

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Object? body,
  }) async {
    http.Response response;
    String url = baseURL + endPoint;
    //1. base url
    if (kDebugMode) {
      print("url $url");
    }
    //2.parse url with Uri.parse()
    Uri uri = Uri.parse(url);
    //3. make post request
    Map<String, String> _header = {'Content-Type': 'application/json'};

    if (kDebugMode) {
      print("body string ${body.toString()}");
    }
    response = await http.post(uri, body: jsonEncode(body), headers: _header);

    if (kDebugMode) {
      print("response ${response.body.toString()}");
    }
    //4. Error handling for the response
    return _responseHandler(response: response);
  }

  ///returns response data of get request
  Future<dynamic> get({
    required String endPoint,
  }) async {
    http.Response response;
    String url = baseURL + endPoint;
    //1. base url
    if (kDebugMode) {
      print("url $url");
    }
    //2.parse url with Uri.parse()
    Uri uri = Uri.parse(url);

    //3. make get request

    Map<String, String> _header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Global.userObj.token.toString()}'
    };

    response = await http.get(uri, headers: _header);

    if (kDebugMode) {
      print("response ${response.body.toString()}");
    }
    //4. Error handling for the response
    return _responseHandler(response: response);
  }

  dynamic _responseHandler({
    required http.Response response,
  }) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }
    if (response.statusCode == 400) {
      throw RequestErrorException(
          responseMessage: jsonDecode(response.body)['message']);
    } else {
      throw UnknownServerException();
    }
  }
}
