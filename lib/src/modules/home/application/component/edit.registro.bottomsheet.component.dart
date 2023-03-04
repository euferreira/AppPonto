import 'package:app_ponto/src/modules/home/application/home.controller.dart';
import 'package:app_ponto/src/shared/widgets/ponto_bottomsheet/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ponto/domain/entity/ponto.enum.dart';

class EditRegistroBottomsheet extends GetView<HomeController> with PontoBottomSheetMixin {
  final PontoType type;
  const EditRegistroBottomsheet({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return PontoBottomsheet(
      title: PontoBottomsheetTitle(
        title: getTitle,
      ),
    );
  }

  String get getTitle {
    switch (type) {
      case PontoType.entrada1:
        if (controller.ponto.value!.entrada1 != null) {
          return 'Editar entrada 1';
        }

        return 'Adicionar entrada 1';
      case PontoType.saida1:
        if (controller.ponto.value!.saida1 != null) {
          return 'Editar saída 1';
        }

        return 'Adicionar saída 1';
      case PontoType.entrada2:
        if (controller.ponto.value!.entrada2 != null) {
          return 'Editar entrada 2';
        }

        return 'Adicionar entrada 2';
      case PontoType.saida2:
        if (controller.ponto.value!.saida2 != null) {
          return 'Editar saída 2';
        }

        return 'Adicionar saída 2';
      default:
        return '';
    }
  }
}
