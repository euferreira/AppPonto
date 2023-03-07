import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.entity.dart';
import 'package:app_ponto/src/shared/utils/datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSugestoes extends StatelessWidget {
  final PontoEntity ponto;

  const CardSugestoes({
    Key? key,
    required this.ponto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sugestões',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                suggestionItem(
                  context,
                  title: 'Início Almoço',
                  value: ponto.sugestaoInicioAlmoco,
                ),
                suggestionItem(
                  context,
                  title: 'Fim Almoço',
                  value: ponto.sugestaoFimAlmoco,
                ),
                suggestionItem(
                  context,
                  title: 'Fim jornada',
                  value: ponto.sugestaoFimJornada,
                ),
                if (ponto.horasTrabalhadas != null)
                  suggestionItem(
                    context,
                    title: 'Horas trabalhadas',
                    value: DateTime(
                      0,
                      0,
                      0,
                      ponto.horasTrabalhadas!.inHours,
                      ponto.horasTrabalhadas!.inMinutes % 60,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column suggestionItem(BuildContext context, {required String title, required DateTime? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 12),
            Text(
              title,
              style: context.textTheme.bodyLarge,
            ),
            const Spacer(),
            Text(
              value?.format(formato: 'HH:mm') ?? '--:--',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
