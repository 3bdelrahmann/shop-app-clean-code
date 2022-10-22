import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.onTap}) : super(key: key);

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      canRequestFocus: false,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: AppColors.green, borderRadius: BorderRadius.circular(35.0)),
        child: Text(
          'Sign in',
          style: AppTextStyles()
              .getBoldStyle(color: AppColors.white, fontSize: AppFontSize.s18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
