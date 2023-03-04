import 'package:app_ponto/src/core/app.binding.dart';
import 'package:get/instance_manager.dart';

import 'menu_mais.controller.dart';

class MenuMaisBinding extends Binding {
  @override
  void dependencies() {
    exports();
  }

  @override
  void exports() {
    Get.lazyPut(() => MenuMaisController());
  }
}
