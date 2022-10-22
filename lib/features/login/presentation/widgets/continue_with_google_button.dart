import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_assets.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///Todo: googleLogin();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightGrey,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(AppAssets.googleLogo),
              height: 24.0,
              width: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Continue with Google',
                style: AppTextStyles().getBoldStyle(
                    color: AppColors.green, fontSize: AppFontSize.s18),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.green,
            )
          ],
        ),
      ),
    );
  }
}
