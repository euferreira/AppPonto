import 'package:get/get.dart';

class LifeCycleService extends SuperController {
  static LifeCycleService get to => Get.find();
  final _onBackground = RxBool(false);

  bool get isBackground => _onBackground.value;

  @override
  void onDetached() {
    _onBackground(true);
  }

  @override
  void onInactive() {
    _onBackground(true);
  }

  @override
  void onPaused() {
    _onBackground(true);
  }

  @override
  void onResumed() {
    _onBackground(false);
  }
}
