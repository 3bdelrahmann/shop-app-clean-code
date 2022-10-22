import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final IconData icon;
  final String text;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    Color iconColor = isSelected ? AppColors.green : AppColors.lightGrey;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30.0,
          ),
          Text(
            text,
            style: AppTextStyles().getRegularStyle(color: iconColor),
          ),
        ],
      ),
    );
  }
}
