import 'package:get/get.dart';

import '../../navigation/navigation.module.dart';

class SplashController extends GetxController {
  RxInt image = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    await 2.delay();
    Get.offAllNamed(NavigationRoute.navbar);
  }
}
