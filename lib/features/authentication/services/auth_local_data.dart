import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exceptions.dart';

//token can't start with:
// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu'
// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy'
// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu'

class AuthLocalData {
  final SharedPreferences sharedPreferences;
  AuthLocalData({
    required this.sharedPreferences,
  });
}
