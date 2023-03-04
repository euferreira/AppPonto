import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../constants.dart';

class PontoSlidable extends StatelessWidget {
  final void Function(BuildContext) onDelete;
  final void Function(BuildContext) onEdit;
  final String title;
  final String hora;

  const PontoSlidable({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.title,
    required this.hora,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        key: const ValueKey(0),
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDelete(context),
            backgroundColor: ColorsPallet.red700,
            foregroundColor: ColorsPallet.light0,
            icon: Icons.delete,
            label: 'Excluir',
          ),
          SlidableAction(
            onPressed: (context) => onEdit(context),
            backgroundColor: ColorsPallet.blue900,
            foregroundColor: ColorsPallet.light0,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      ),
      child: Card(
        elevation: 4,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          0.5,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                hora,
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
