import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class UtilsLanguage {
  static final UtilsLanguage _singleton = UtilsLanguage._internal();
  factory UtilsLanguage() => _singleton;
  UtilsLanguage._internal();
  static UtilsLanguage get shared => _singleton;
  dynamic jsonResponse;
  Future<String> loadStringJson(String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  Future<dynamic> readFileJson(String filePath) async {
    String jsonString = await loadStringJson(filePath);
    jsonResponse = jsonDecode(jsonString);
    return jsonResponse;
  }

  String language(String key, String text) {
    if (["", null, false, 0].contains(jsonResponse[key])) {
      return text;
    } else {
      return jsonResponse[key];
    }
  }
}
