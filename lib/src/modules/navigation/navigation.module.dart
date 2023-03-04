import 'package:get/get.dart';

import '../../core/app.module.dart';
import '../home/home.module.dart';
import '../menu/menu.module.dart';
import 'application/bottom_navbar.binding.dart';
import 'application/bottom_navbar.page.dart';

class NavigationModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: NavigationRoute.navbar,
      binding: BottomNavbarBinding(),
      page: () => const BottomNavbarPage(),
      children: Routes.to.list([
        HomeModule().routes,
        MenuModule().routes,
      ]),
    ),
  ];
}

class NavigationRoute {
  static const String navbar = '/bottom-navbar';
}

class NavigationIndex {
  static const int home = 0;
  static const int config = 1;
}
