import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meetcampus_mobil/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
void main() async {
  //onboarding just to see once
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);

  //hide status bar
  await SystemChrome.setEnabledSystemUIOverlays([]);

  //disable rotation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'assets/language',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,

    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'meetcampus',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
      routes: {
        '/': (context) => MainScreen(),
        'first': (context) => MainScreen(),
      },
    );
  }
}
