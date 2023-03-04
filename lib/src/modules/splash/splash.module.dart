import 'package:get/get.dart';

import '../../core/app.module.dart';
import 'application/splash.binding.dart';
import 'application/splash.page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
