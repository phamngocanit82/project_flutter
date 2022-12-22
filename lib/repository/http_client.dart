import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'api_exception.dart';
class HttpClient {
  HttpClient._privateConstructor();
  static final HttpClient _instance = HttpClient._privateConstructor();
  factory HttpClient() {
    return _instance;
  }
  Future<dynamic> getRequest(String path) async {
    Response response;
    try {
      var url = Uri.parse(path);
      response = await get(url);
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 299) {
        if (response.body.isEmpty) {
          return <dynamic>[];
        } else {
          return jsonDecode(response.body);
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        throw ServerErrorException();
      } else {
        throw UnknownException();
      }
    } on SocketException {
      throw ConnectionException();
    }
  }
  Future<dynamic> createAlbum(String title) async {
    Response response;
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
      response = await post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': title,
          }),
      );
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 299) {
        if (response.body.isEmpty) {
          return <dynamic>[];
        } else {
          return jsonDecode(response.body);
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        throw ServerErrorException();
      } else {
        throw UnknownException();
      }
    } on SocketException {
      throw ConnectionException();
    }
  }
}



