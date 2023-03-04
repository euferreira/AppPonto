part of ponto_bottomsheet;

enum PontoBottomsheetSize {
  sm,
  md,
  lg,
  xl,
  full;

  double get value {
    final pixelRatio = Get.pixelRatio.clamp(1, 3);
    final resize = (1 / pixelRatio - 1 / 3).clamp(0, 1);

    switch (this) {
      case PontoBottomsheetSize.sm:
        return 0.3 + 0.6 * resize;
      case PontoBottomsheetSize.md:
        return 0.5 + 0.4 * resize;
      case PontoBottomsheetSize.lg:
        return 0.7 + 0.2 * resize;
      case PontoBottomsheetSize.xl:
        return 0.9;
      case PontoBottomsheetSize.full:
        return 1;
    }
  }

  PontoBottomsheetSize sizeBottomsheet(int value) {
    switch (value) {
      case 1:
        return PontoBottomsheetSize.full;
      default:
        return PontoBottomsheetSize.xl;
    }
  }

  PontoBottomsheetSize sizeBottomsheetString(String value) {
    switch (value) {
      case 'full':
        return PontoBottomsheetSize.full;
      case 'xl':
        return PontoBottomsheetSize.xl;
      case 'lg':
        return PontoBottomsheetSize.lg;
      case 'md':
        return PontoBottomsheetSize.md;
      case 'sm':
        return PontoBottomsheetSize.sm;
      default:
        return PontoBottomsheetSize.xl;
    }
  }
}
