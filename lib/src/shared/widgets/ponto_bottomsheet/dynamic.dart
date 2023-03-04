part of ponto_bottomsheet;

abstract class PontoBottomSheetComponent<T> extends GetView<T> with PontoBottomSheetMixin {
  const PontoBottomSheetComponent({Key? key}) : super(key: key);

  Widget? get title => null;
  Widget get body;
  Widget? get footer => null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const PontoBottomsheetHeader(),
            if (title != null) ...[
              title!,
              const SizedBox(height: 16),
            ],
            body,
            if (footer != null) ...[
              const SizedBox(height: 16),
              footer!,
            ],
          ],
        ),
      ),
    );
  }
}
