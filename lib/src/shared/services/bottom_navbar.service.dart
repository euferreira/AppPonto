import 'dart:async';

import 'package:get/get.dart';

import '../../modules/home/home.module.dart';
import '../../modules/menu/menu.module.dart';
import '../../modules/navigation/navigation.module.dart';

class BottomNavbar {
  static BottomNavbarService get to => Get.find<BottomNavbarService>();

  static GetDelegate get delegate => to.delegate;

  static Map<String, String> get params => to.delegate.parameters;

  static int get index => to.currentIndex;

  static void navigate(int index) => to.navigateByIndex(index);

  static String get currentRoute => to.delegate.currentConfiguration?.currentPage?.name ?? '';

  static Future<T> changePage<T>(String route) => to.changePage<T>(route);

  static Future<bool> back({Object? result}) => to.back(result: result);

  static void showMenu(bool value) => to.showMenu(value);
}

class BottomNavbarService extends GetxService {
  final GetDelegate delegate = GetDelegate();

  int currentIndex = 0;
  String menuSelecionado = '';
  RxBool showMenu = true.obs;
  bool overBottomNavbar = false;

  final _allCompleters = <String, Completer>{};

  @override
  void onInit() {
    delegate.addListener(() {
      final page = delegate.currentConfiguration?.currentPage?.name ?? '';
      updateIndex(page.replaceFirst(NavigationRoute.navbar, ""));
    });
    super.onInit();
  }

  Future<T> changePage<T>(
    String route, {
    Map<String, String>? params,
    dynamic args,
    bool showMenu = true,
    bool newStack = false,
  }) {
    final completer = Completer<T>();
    final currentRoute = delegate.currentConfiguration?.currentPage?.name ?? '';
    _allCompleters[currentRoute] = completer;

    if (!newStack) {
      toggleMenu(showMenu: showMenu);
      if (overBottomNavbar) Get.back();
      overBottomNavbar = false;

      delegate.toNamed(
        "${NavigationRoute.navbar}$route",
        parameters: params,
        arguments: args,
      );
      return completer.future;
    }

    setParams(params);
    setArgs(args);

    overBottomNavbar = true;
    Get.toNamed(
      "${NavigationRoute.navbar}$route",
      parameters: params,
      arguments: args,
    );
    return completer.future;
  }

  Future<bool> back({Object? result, bool? showMenu = true}) async {
    final currentPage = delegate.currentConfiguration?.currentPage?.name ?? '';
    final lengthTreeBranch = delegate.currentConfiguration?.currentTreeBranch.length;

    verifyChangeNavigation(currentPage);
    toggleMenu(showMenu: showMenu);

    if (overBottomNavbar) {
      overBottomNavbar = false;
      Get.back(result: result);
      return true;
    }

    lengthTreeBranch != null && lengthTreeBranch > 3
        ? await delegate.popRoute(result: result)
        : changePage(menuSelecionado);

    final route = delegate.currentConfiguration?.currentPage?.name;
    if (_allCompleters.containsKey(route)) {
      _allCompleters[route]?.complete(result);
      _allCompleters.remove(route);
    }
    return true;
  }

  void setParams(Map<String, String>? params) {
    delegate.parameters.clear();
    if (params != null) delegate.parameters.addAll(params);
  }

  void setArgs(dynamic args) {}

  void verifyChangeNavigation(String route) {
    route = route.replaceFirst(NavigationRoute.navbar, "");
    return;
  }

  void navigateByIndex(int index) {
    switch (index) {
      case NavigationIndex.home:
        menuSelecionado = HomeRoute.home;
        changePage(HomeRoute.home);
        break;

      case NavigationIndex.config:
        menuSelecionado = MenuRoute.menuMais;
        changePage(MenuRoute.menuMais);
        break;
    }
  }

  void updateIndex(String route) {
    currentIndex = getIndex(route.replaceFirst(NavigationRoute.navbar, ""));
  }

  void toggleMenu({bool? showMenu}) {
    if (showMenu != null) {
      this.showMenu.value = showMenu;
      return;
    }
    this.showMenu.toggle();
  }

  int getIndex(String route) {
    if (route.contains(HomeRoute.home)) {
      return 0;
    }
    if (route.contains(MenuRoute.menuMais)) {
      return 1;
    }
    return 0;
  }
}
