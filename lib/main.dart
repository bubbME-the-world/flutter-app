import 'package:bubbme/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/di/injectore.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initializeDependencies();
  Map<String, Map<String, String>> languages = await di.init();
  await GetStorage.init();

  runApp(MyApp(languages: languages));
  /*runApp(
    GetMaterialApp(
      title: "Bubbme",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );*/
}
