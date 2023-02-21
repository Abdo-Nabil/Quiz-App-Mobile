import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/error/exceptions.dart';

//token can't start with:
// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu'
// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy'
// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu'

class GeneralLocalData {
  final SharedPreferences sharedPreferences;
  GeneralLocalData({
    required this.sharedPreferences,
  });

  String? getString(String key) {
    final String? result = sharedPreferences.getString(key);
    return result;
  }

  Future setString(String key, String value) async {
    final bool result = await sharedPreferences.setString(key, value);
    if (!result) {
      throw CacheSavingException();
    }
  }
}
