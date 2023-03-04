import 'package:app_ponto/src/modules/menu/mais/menu_mais.page.dart';
import 'package:get/get.dart';

import '../../core/app.module.dart';
import 'mais/menu_mais.binding.dart';

class MenuModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: MenuRoute.menuMais,
      page: () => const MenuMaisPage(),
      binding: MenuMaisBinding(),
    ),
  ];
}

class MenuRoute {
  static const String menuMais = '/menu-mais';
}
