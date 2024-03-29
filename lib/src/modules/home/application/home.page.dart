import 'package:app_ponto/src/modules/home/application/widgets/card-sugestoes.widget.dart';
import 'package:app_ponto/src/shared/utils/datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/ponto.slidable.widget.dart';
import '../../../shared/widgets/skeleton-list.widget.dart';
import '../../ponto/domain/entity/ponto.enum.dart';
import 'home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Obx(() => Text(controller.headerText.value)),
            floating: true,
            snap: true,
            actions: [
              Obx(() => Text(
                    controller.dataSelecionada.value.format(
                      formato: 'dd/MM/yy',
                    ),
                  )),
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined),
                onPressed: () => controller.openCalendar(context),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(() {
                  return Text(
                    'Registros de ${controller.verifyDate}',
                    style: context.textTheme.titleMedium,
                  );
                })),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Obx(() {
                if (controller.loadingList.isTrue) {
                  return const SkeletonItemList();
                }

                return Column(
                  children: [
                    PontoSlidable(
                      onDelete: (_) => controller.deletePonto(PontoType.entrada1),
                      onEdit: (_) => controller.onEdit(PontoType.entrada1),
                      title: 'Entrada 1',
                      hora: makeHoraTitle(controller.ponto.value?.entrada1),
                    ),
                    PontoSlidable(
                      onDelete: (_) => controller.deletePonto(PontoType.saida1),
                      onEdit: (_) => controller.onEdit(PontoType.saida1),
                      title: 'Saída 1',
                      hora: makeHoraTitle(controller.ponto.value?.saida1),
                    ),
                    PontoSlidable(
                      onDelete: (_) => controller.deletePonto(PontoType.entrada2),
                      onEdit: (_) => controller.onEdit(PontoType.entrada2),
                      title: 'Entrada 2',
                      hora: makeHoraTitle(controller.ponto.value?.entrada2),
                    ),
                    PontoSlidable(
                      onDelete: (_) => controller.deletePonto(PontoType.saida2),
                      onEdit: (_) => controller.onEdit(PontoType.saida2),
                      title: 'Saída 2',
                      hora: makeHoraTitle(controller.ponto.value?.saida2),
                    ),
                    if (controller.ponto.value?.sugestaoInicioAlmoco != null) ...[
                      const SizedBox(height: 12),
                      CardSugestoes(
                        ponto: controller.ponto.value!,
                      ),
                    ],
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String makeHoraTitle(DateTime? value) {
    return controller.ponto.value?.isFolga == true || controller.ponto.value?.isFeriado == true
        ? 'Folga'
        : value?.format(formato: 'HH:mm') ?? '--:--';
  }
}
