import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meetcampus_mobil/screens/onboarding/onboarding_screen.dart';
import 'package:meetcampus_mobil/utilities/class_builder.dart';
import 'package:meetcampus_mobil/utilities/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
void main() async {
  //create class for drawer
  ClassBuilder.registerClasses();
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
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'meetcampus',
      theme: theme.getTheme(),
      initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        'first': (context) => OnboardingScreen(),
      },
    );
  }
}
