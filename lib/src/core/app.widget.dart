import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../themes/theme.ponto.dart';
import 'app.binding.dart';
import 'app.module.dart';

class PontoApp extends GetView {
  const PontoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ponto',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      getPages: AppModule().routes,
      initialBinding: AppBinding(),
      enableLog: kDebugMode,
      debugShowCheckedModeBanner: kDebugMode,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
