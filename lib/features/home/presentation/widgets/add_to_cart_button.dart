import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';

class AddToCardButton extends StatelessWidget {
  AddToCardButton({Key? key, required this.product}) : super(key: key);

  final ProductsEntity product;

  int length = 0;
  @override
  Widget build(BuildContext context) {
    if (length == 0) {
      return InkWell(
        onTap: () {
          length += 1;
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(20.0)),
          ),
          child: Center(
            child: Text(
              'ADD TO CART',
              style: AppTextStyles().getSemiBoldStyle(
                  color: AppColors.white, fontSize: AppFontSize.s16),
            ),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: AppColors.green,
          borderRadius:
              BorderRadiusDirectional.only(bottomStart: Radius.circular(20.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                length -= 1;
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.remove,
                  size: 20.0,
                  color: AppColors.green,
                ),
              ),
            ),
            Text(
              length.toString(),
              style: AppTextStyles().getBoldStyle(
                  color: AppColors.white, fontSize: AppFontSize.s16),
            ),
            GestureDetector(
              onTap: () {
                length += 1;
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.add,
                  size: 20.0,
                  color: AppColors.green,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
