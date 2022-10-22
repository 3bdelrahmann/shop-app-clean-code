import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: AppColors.green,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: AppColors.green,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Search for a product',
              style: AppTextStyles().getSemiBoldStyle(
                  color: AppColors.green, fontSize: AppFontSize.s17),
            )
          ],
        ),
      ),
    );
  }
}
