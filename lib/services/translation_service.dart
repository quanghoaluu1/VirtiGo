import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static Map<String, Map<String, String>> translations = {};

  @override
  Map<String, Map<String, String>> get keys => translations;

  /// Load tất cả JSON trong assets/translations
  static Future<void> init() async {
    translations['en_US'] = await _loadJson('assets/translations/en.json');
    translations['vi_VN'] = await _loadJson('assets/translations/vi.json');
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final data = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(data));
  }
}