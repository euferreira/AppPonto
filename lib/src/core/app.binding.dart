import 'package:get/get.dart';

import '../shared/services/lifecycle.service.dart';
import '../shared/services/theme.service.dart';

abstract class Binding extends Bindings {
  void exports();

  void reload() {
    throw UnimplementedError();
  }
}

class AppBinding extends Binding {
  @override
  void dependencies() {
    exports();
  }

  @override
  void exports() {
    Get.put(LifeCycleService(), permanent: true);
    Get.put(ThemeService(), permanent: true);
  }
}
