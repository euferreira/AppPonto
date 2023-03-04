part of ponto_bottomsheet;

class PontoBottomsheetTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTapBack;
  final TextStyle? titleStyle;

  const PontoBottomsheetTitle({
    Key? key,
    required this.title,
    this.onTapBack,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: context.isDarkMode ? ColorsPallet.light0 : ColorsPallet.mid600,
              ),
              onPressed: onTapBack ?? Get.back),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(title, style: titleStyle ?? context.textTheme.titleMedium),
        ),
      ],
    );
  }
}
