import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../shared/services/bottom_navbar.service.dart';
import '../navigation.module.dart';
import 'bottom_navbar.controller.dart';
import 'widgets/navigationbar_item.widget.dart';

class BottomNavbarPage extends GetView<BottomNavbarController> {
  const BottomNavbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? debounceClick;

    return GetRouterOutlet.builder(
      routerDelegate: BottomNavbar.delegate,
      builder: (context, delegate, navConfig) {
        return WillPopScope(
          onWillPop: () => controller.onWillPop(navConfig),
          child: Scaffold(
            body: GetRouterOutlet(
              initialRoute: "${NavigationRoute.navbar}/home",
              anchorRoute: NavigationRoute.navbar,
              delegate: delegate,
            ),
            bottomNavigationBar: Obx(
              () => BottomNavbar.to.showMenu.isTrue
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        elevationWidget(context,
                            child: SafeArea(
                              child: Container(
                                height: 82,
                                color: context.theme.bottomNavigationBarTheme.backgroundColor,
                                child: TabBar(
                                  controller: controller.tabController,
                                  indicator: const BoxDecoration(),
                                  labelPadding: EdgeInsets.zero,
                                  onTap: (index) {
                                    if (debounceClick?.isActive ?? false) {
                                      debounceClick?.cancel();
                                    }
                                    debounceClick = Timer(const Duration(milliseconds: 500), () {
                                      controller.changeIndex(index);
                                    });
                                  },
                                  tabs: [
                                    NavigationBarItem(
                                      icon: Icons.home,
                                      activeIcon: const Icon(
                                        Icons.home,
                                        size: 18,
                                      ),
                                      label: 'Home',
                                      active: _active(NavigationIndex.home),
                                    ),
                                    NavigationBarItem(
                                      icon: Icons.list,
                                      activeIcon: const Icon(
                                        Icons.list,
                                        size: 18,
                                      ),
                                      label: 'Mais',
                                      active: _active(NavigationIndex.config),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }

  Material elevationWidget(BuildContext context, {required Widget child}) {
    return Material(
      elevation: 8,
      color: context.isDarkMode ? Colors.black : Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1,
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }

  bool _active(int index) => BottomNavbar.index == index;
}
