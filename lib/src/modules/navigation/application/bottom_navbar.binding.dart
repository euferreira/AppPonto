import 'package:get/get.dart';

import '../../../core/app.binding.dart';
import '../../../shared/services/bottom_navbar.service.dart';
import 'bottom_navbar.controller.dart';

class BottomNavbarBinding extends Binding {
  @override
  void dependencies() {
    exports();
  }

  @override
  void exports() {
    Get.lazyPut(() => BottomNavbarService(), fenix: true);
    Get.lazyPut(() => BottomNavbarController(), fenix: true);
  }
}
