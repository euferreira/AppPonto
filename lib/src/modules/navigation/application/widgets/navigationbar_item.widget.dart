import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants.dart';

class NavigationBarItem extends StatelessWidget {
  final IconData icon;
  final Widget activeIcon;
  final bool active;
  final String label;
  final VoidCallback? onTap;

  const NavigationBarItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.active,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          active
              ? Container(
                  width: 35,
                  height: 3,
                  decoration: BoxDecoration(
                    color: ColorsPallet.dark1000,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              : const SizedBox(
                  height: 5,
                ),
          const Spacer(),
          active
              ? activeIcon
              : Icon(
                  icon,
                  size: 18,
                  color: context.isDarkMode ? Colors.grey : Colors.grey,
                ),
          const SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text(
              label,
              style: _style(context, active),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  TextStyle _style(BuildContext context, bool active) {
    TextStyle selectedLabelStyle = context.textTheme.bodySmall!.copyWith(
      //color: ColorsPallet.red600.withOpacity(.8),
      fontWeight: FontWeight.w600,
    );
    TextStyle unselectedLabelStyle = context.textTheme.bodySmall!.copyWith(
      color: context.isDarkMode ? Colors.grey : null,
      fontWeight: FontWeight.w500,
    );

    return active ? selectedLabelStyle : unselectedLabelStyle;
  }
}
