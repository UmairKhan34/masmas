// ignore_for_file: unused_import, avoid_print, use_build_context_synchronously

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:masmas/services/hive_db.dart';
import 'package:path_provider/path_provider.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/routes/routes_view.dart';
import 'package:masmas/src/auth/view_model/auth_vm.dart';
import 'package:masmas/src/base/view/bottom_navigation.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:masmas/src/landing/splash.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import 'resources/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('languageBox');

  runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthVM()),
              ChangeNotifierProvider(create: (_) => BaseVM())
            ],
            child: const MyApp(),
          ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      String? storedLanguage = await HiveDb.getLanguage();
      Constant.language = storedLanguage;
      print('---$storedLanguage');
      String? storedThemeMode = await HiveDb.getThemeMode();
      Constant.themeMode = storedThemeMode;
      if (storedThemeMode == "ThemeMode.dark") {
        context.read<BaseVM>().themeMode = ThemeMode.dark;

        context.read<BaseVM>().update();
      } else {
        context.read<BaseVM>().themeMode = ThemeMode.light;
        context.read<BaseVM>().update();
      }
      print('--$storedThemeMode');
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BaseVM>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        themeMode: provider.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        initialRoute: SplashScreen.route,
        getPages: AppRoutes.pages,
      );
    });
  }
}
