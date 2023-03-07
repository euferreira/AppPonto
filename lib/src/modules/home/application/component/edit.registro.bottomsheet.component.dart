import 'package:app_ponto/src/modules/home/application/home.controller.dart';
import 'package:app_ponto/src/shared/constants.dart';
import 'package:app_ponto/src/shared/utils/datetime.dart';
import 'package:app_ponto/src/shared/widgets/ponto_bottomsheet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../ponto/domain/entity/ponto.enum.dart';

class EditRegistroBottomsheet extends GetView<HomeController> with PontoBottomSheetMixin {
  final PontoType type;

  const EditRegistroBottomsheet({super.key, required this.type});

  @override
  Future<void> beforeOpen() async {
    controller.isFeriado.value = controller.ponto.value?.isFeriado ?? false;
    controller.isFolga.value = controller.ponto.value?.isFolga ?? false;

    if (type == PontoType.entrada1) {
      controller.timeController.text = controller.ponto.value!.entrada1?.format(formato: 'HH:mm') ?? '';
    } else if (type == PontoType.saida1) {
      controller.timeController.text = controller.ponto.value!.saida1?.format(formato: 'HH:mm') ?? '';
    } else if (type == PontoType.entrada2) {
      controller.timeController.text = controller.ponto.value!.entrada2?.format(formato: 'HH:mm') ?? '';
    } else if (type == PontoType.saida2) {
      controller.timeController.text = controller.ponto.value!.saida2?.format(formato: 'HH:mm') ?? '';
    } else {
      controller.timeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PontoBottomsheet(
      title: PontoBottomsheetTitle(
        title: getTitle,
      ),
      size: PontoBottomsheetSize.lg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.timeController,
            decoration: const InputDecoration(
              labelText: 'Horário',
              hintText: '00:00',
            ),
            keyboardType: TextInputType.number,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  final hour = value.hour.toString().padLeft(2, '0');
                  final minute = value.minute.toString().padLeft(2, '0');
                  final time = '$hour:$minute';
                  controller.timeController.text = time;
                  DateTime date = DateTime(
                    controller.dataSelecionada.value.year,
                    controller.dataSelecionada.value.month,
                    controller.dataSelecionada.value.day,
                    value.hour,
                    value.minute,
                  );

                  controller.ponto.value!.pontoType = type;

                  if (type == PontoType.entrada1) {
                    controller.ponto.value!.entrada1 = date;
                  }
                  else if (type == PontoType.saida1) {
                    controller.ponto.value!.saida1 = date;
                  }
                  else if (type == PontoType.entrada2) {
                    controller.ponto.value!.entrada2 = date;
                  }
                  else if (type == PontoType.saida2) {
                    controller.ponto.value!.saida2 = date;
                  }

                  bool validate = controller.ponto.value!.validateByType();
                  if (!validate) {
                    Alerts.showError(message: 'Horário inválido!');
                  }

                  controller.ponto.refresh();
                }
              });
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            return Column(
              children: [
                SwitchListTile(
                  title: const Text('Feriado'),
                  value: controller.isFeriado.isTrue,
                  onChanged: (_) {
                    if (controller.isFolga.isTrue) {
                      controller.isFolga.toggle();
                    }

                    controller.isFeriado.toggle();
                    controller.ponto.value!.isFeriado = controller.isFeriado.value;

                    if (controller.isFeriado.isTrue) {
                      controller.ponto.value!.entrada1 = null;
                      controller.ponto.value!.saida1 = null;
                      controller.ponto.value!.entrada2 = null;
                      controller.ponto.value!.saida2 = null;
                      controller.timeController.text = "Feriado";
                    }
                  },
                ),
                SwitchListTile(
                  title: const Text('Folga'),
                  value: controller.isFolga.isTrue,
                  onChanged: (_) {
                    if (controller.isFeriado.isTrue) {
                      controller.isFeriado.toggle();
                    }

                    controller.isFolga.toggle();
                    controller.ponto.value!.isFolga = controller.isFolga.value;

                    if (controller.isFolga.isTrue) {
                      controller.ponto.value!.entrada1 = null;
                      controller.ponto.value!.saida1 = null;
                      controller.ponto.value!.entrada2 = null;
                      controller.ponto.value!.saida2 = null;
                      controller.timeController.text = "Folga";
                    }
                  },
                ),
              ],
            );
          }),
        ],
      ),
      footer: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: Get.back,
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async => await controller.savePonto(),
                child: const Text('Salvar'),
              ),
            ],
          ),
        ],
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
