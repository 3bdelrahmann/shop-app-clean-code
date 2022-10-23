import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({Key? key, required this.onTap}) : super(key: key);

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.red),
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          'Remove',
          style: AppTextStyles()
              .getBoldStyle(color: AppColors.red, fontSize: AppFontSize.s12),
        ),
      ),
    );
  }
}
