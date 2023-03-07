import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.enum.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/ponto_bottomsheet/main.dart';
import '../home.controller.dart';
import 'package:get/get.dart';

class DeleteRegistroBottomsheet extends GetView<HomeController> with PontoBottomSheetMixin {
  final PontoType type;

  const DeleteRegistroBottomsheet({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return PontoBottomsheet(
      title: PontoBottomsheetTitle(
        title: getTitle,
      ),
      size: PontoBottomsheetSize.sm,
      body: Obx(() => makeBody(context)),
      footer: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: Get.back,
              child: Text(
                hasDataToDelete ? 'Cancelar' : 'Fechar',
              ),
            ),
            if (hasDataToDelete)
              TextButton(
                onPressed: () async => await controller.deleteRegistro(type),
                child: const Text('Excluir'),
              ),
          ],
        ),
      ),
    );
  }

  String get getTitle {
    switch (type) {
      case PontoType.entrada1:
        return 'Excluir entrada 1';
      case PontoType.saida1:
        return 'Excluir saída 1';
      case PontoType.entrada2:
        return 'Excluir entrada 2';
      case PontoType.saida2:
        return 'Excluir saída 2';
      default:
        return '';
    }
  }

  Widget makeBody(BuildContext context) {
    if (!hasDataToDelete) {
      return Text(
        'Não há registro para ser excluído.',
        style: context.textTheme.bodyLarge,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Tem certeza que deseja excluir este registro?',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }

  bool get hasDataToDelete {
    return (type == PontoType.entrada1 && controller.ponto.value!.entrada1 != null) ||
        (type == PontoType.saida1 && controller.ponto.value!.saida1 != null) ||
        (type == PontoType.entrada2 && controller.ponto.value!.entrada2 != null) ||
        (type == PontoType.saida2 && controller.ponto.value!.saida2 != null);
  }
}
