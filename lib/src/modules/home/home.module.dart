import 'package:app_ponto/src/core/app.module.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'application/home.binding.dart';
import 'application/home.page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: HomeRoute.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

class HomeRoute {
  static const String home = '/home';
}
