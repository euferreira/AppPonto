part of ponto_bottomsheet;

class PontoBottomsheetHeader extends StatelessWidget {
  const PontoBottomsheetHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? ColorsPallet.grey700 : ColorsPallet.light400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
