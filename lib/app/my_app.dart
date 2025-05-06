import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants/app_constants.dart';
import 'routes/app_pages.dart';
import 'utils/controllers/language_controller.dart';
import 'utils/messages.dart';

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({
    super.key,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        title: 'Bubbme',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(
          AppConstants.languages[0].languageCode,
          AppConstants.languages[0].countryCode,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
