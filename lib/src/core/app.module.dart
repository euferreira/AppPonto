import 'package:get/get.dart';

import '../modules/navigation/navigation.module.dart';
import '../modules/splash/splash.module.dart';

abstract class Module {
  late List<GetPage> routes;
}

class Routes {
  static Routes get to => Routes();

  List<T> list<T>(Iterable<Iterable<T>> list) => [for (var item in list) ...item];
}

class AppModule implements Module {
  @override
  List<GetPage> routes = Routes.to.list([
    SplashModule().routes,
    NavigationModule().routes,
  ]);
}
