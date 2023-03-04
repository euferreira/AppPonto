import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/services/bottom_navbar.service.dart';
import '../navigation.module.dart';

class BottomNavbarController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
  );

  Future<bool> onWillPop(GetNavConfig? config) async {
    String actualPage = config?.location ?? '';
    if (actualPage.contains("${NavigationRoute.navbar}/")) {
      BottomNavbar.to.back();
    }
    return false;
  }

  void changeIndex(int index) {
    BottomNavbar.navigate(index);
  }
}
