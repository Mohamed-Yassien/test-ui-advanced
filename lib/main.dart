import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/record/screens/record_screen.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
        Locale.fromSubtags(
          languageCode: 'en',
        ),
        Locale.fromSubtags(
          languageCode: 'ar',
        ),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'EG'),
      startLocale: const Locale('ar', 'EG'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
        Locale.fromSubtags(
          languageCode: 'en',
        ),
        Locale.fromSubtags(
          languageCode: 'ar',
        ),
      ],
      localizationsDelegates: context.localizationDelegates +
          [
            CountryLocalizations.delegate,
          ],
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const RecordScreen(),
    );
  }
}
