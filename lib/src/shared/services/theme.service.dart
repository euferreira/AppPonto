import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeService extends GetxService with WidgetsBindingObserver {
  final Rx<ThemeMode> _systemTheme = ThemeMode.light.obs;
  final RxBool _forceDarkStatusBar = false.obs;

  int _darkStatusBarStackCount = 0;

  static ThemeService get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _startListeners();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _systemTheme.trigger(
      Get.isPlatformDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void _startListeners() {
    _systemTheme.listen((systemTheme) {
      final currentTheme = getTheme();
      _changeStatusBarTheme(
          _forceDarkStatusBar.isTrue && currentTheme != ThemeMode.dark && systemTheme == ThemeMode.dark);
    });

    _forceDarkStatusBar.listen((force) {
      final currentTheme = getTheme();
      _changeStatusBarTheme(force && currentTheme != ThemeMode.dark && _systemTheme.value != ThemeMode.dark);
    });

    _systemTheme.value = Get.isPlatformDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode getTheme() {
    Box<String> themeBox = Hive.box<String>("theme");
    if (themeBox.values.isEmpty) {
      return ThemeMode.system;
    }

    String? result = themeBox.getAt(0);

    if (result == ThemeMode.system.toString()) {
      return ThemeMode.system;
    } else if (result == ThemeMode.light.toString()) {
      return ThemeMode.light;
    } else if (result == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void setTheme(ThemeMode theme) {
    final themeBox = Hive.box<String>('theme');
    themeBox.put(0, theme.toString());
  }

  void changeTheme(ThemeMode theme) => Get.changeThemeMode(theme);

  void _changeStatusBarTheme(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      isDark
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
    );
  }

  void forceDarkStatusBar(bool force) {
    _forceDarkStatusBar.value = force;
  }

  void pushDarkStatusBar() {
    _darkStatusBarStackCount++;
    _forceDarkStatusBar.trigger(true);
  }

  void popDarkStatusBar() {
    if (_darkStatusBarStackCount > 0) {
      _darkStatusBarStackCount--;
    }
    _forceDarkStatusBar.value = _darkStatusBarStackCount > 0;
  }
}

mixin ForceStatusBarStylMixin on GetxController {
  @override
  void onInit() {
    super.onInit();
    ThemeService.to.pushDarkStatusBar();
  }

  @override
  void onClose() {
    super.onClose();
    ThemeService.to.popDarkStatusBar();
  }
}
