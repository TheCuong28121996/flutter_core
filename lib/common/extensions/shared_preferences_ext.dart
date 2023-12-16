import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'other_ext.dart';

extension SharedPreferencesExt on SharedPreferences {
  Future<bool>? setObject(String key, Object value) async {
    return await setString(key, json.encode(value));
  }

  T? getObject<T>(String key, T Function(Map<String, dynamic> e) function,
      {T? defValue}) {
    Map<String, dynamic>? map = getJson(key);

    return map == null ? defValue : function(map);
  }

  Map<String, dynamic>? getJson(String key) {
    String? storedJson = getString(key);

    return storedJson.isNullOrEmpty ? null : jsonDecode(storedJson!);
  }

  Future<bool>? setListObject(String key, List<Object> list) {
    List<String>? dataList = list.map((value) {
      return json.encode(value);
    }).toList();

    return setStringList(key, dataList);
  }

  List<T> getListObject<T>(String key, T Function(Map e) function) {
    List<T>? list = getListJson(key)?.map((value) {
      return function(value);
    }).toList();
    return list ?? [];
  }

  List<Map>? getListJson(String key) {
    return getStringList(key)?.map((value) {
      Map dataMap = json.decode(value);
      return dataMap;
    }).toList();
  }
}
