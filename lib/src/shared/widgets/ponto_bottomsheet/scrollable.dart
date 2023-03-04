part of ponto_bottomsheet;

class PontoBottomsheet extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final Widget Function(ScrollController)? builder;
  final Widget? footer;
  final PontoBottomsheetSize size;
  final bool expandSize;
  final EdgeInsets? padding;

  const PontoBottomsheet({
    super.key,
    this.title,
    this.body,
    this.builder,
    this.footer,
    this.size = PontoBottomsheetSize.md,
    this.expandSize = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) {
        return DraggableScrollableSheet(
            initialChildSize: size.value,
            maxChildSize: expandSize && size != PontoBottomsheetSize.full ? 0.9 : size.value,
            expand: false,
            builder: (_, scrollController) {
              final isPortrait = orientation == Orientation.portrait || context.orientation == Orientation.portrait;

              return Stack(
                children: [
                  InkWell(
                    onTap: Get.back,
                    enableFeedback: false,
                    splashFactory: NoSplash.splashFactory,
                    child: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    padding: padding ??
                        const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 25,
                        ),
                    margin: isPortrait
                        ? EdgeInsets.zero
                        : EdgeInsets.only(
                            left: context.width / 3.8,
                            right: context.width / 3.8,
                          ),
                    decoration: BoxDecoration(
                      color: context.isDarkMode ? ColorsPallet.black500 : ColorsPallet.light0,
                      borderRadius: isPortrait
                          ? const BorderRadius.vertical(top: Radius.circular(16))
                          : const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const PontoBottomsheetHeader(),
                        if (title != null) title!,
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: builder != null ? builder!(scrollController) : body,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: footer ?? const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
