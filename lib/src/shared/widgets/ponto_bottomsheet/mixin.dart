part of ponto_bottomsheet;

mixin PontoBottomSheetMixin on StatelessWidget {
  bool? get isScrollControlled => null;

  bool? get isDismissible => null;

  bool? get enableDrag => null;

  Future<void> beforeOpen() async {}

  Future<void> afterClose() async {}

  Future<T?> show<T>({
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) async {
    await beforeOpen();
    final result = await Get.bottomSheet<T>(
      this,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      backgroundColor: Get.isDarkMode ? ColorsPallet.black500 : ColorsPallet.light0,
      isScrollControlled: this.isScrollControlled ?? isScrollControlled,
      isDismissible: this.isDismissible ?? isDismissible,
      enableDrag: this.enableDrag ?? enableDrag,
      settings: RouteSettings(
        name: '${Get.currentRoute}/bottomsheet/${toString()}',
      ),
    );

    await afterClose();
    return result;
  }
}
