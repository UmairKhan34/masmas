import 'package:hive/hive.dart';
import 'package:masmas/constants/constant.dart';

class HiveDb {
  static final _hive = Hive.box('languageBox');
  Future<void> setLanguage(String languageCode) async {
    Constant.language = languageCode;
    _hive.put(Hivekeys.language, languageCode);
  }

  static Future<String?> getLanguage() async {
    String? data;
    data = _hive.get(Hivekeys.language);
    return data;
  }

  Future<void> setThemeMode(String themeMode) async {
    _hive.put(Hivekeys.themeMode, themeMode);
  }

  static Future<String?> getThemeMode() async {
    String? data;
    data = _hive.get(Hivekeys.themeMode);
    return data;
  }
}

class Hivekeys {
  static int language = 1;
  static int themeMode = 2;
}
