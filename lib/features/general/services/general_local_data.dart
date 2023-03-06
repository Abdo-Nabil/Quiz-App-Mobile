import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> removeKey(String key) async {
    final bool isRemoved = await sharedPreferences.remove(key);
    if (!isRemoved) {
      throw CacheRemovingException();
    }
    return true;
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    final String version = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;
    return '$version+$buildNumber'; // like that ==>  1.0.0+1
  }
}
