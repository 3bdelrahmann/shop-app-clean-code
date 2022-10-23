import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_assets.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/cart/presentation/widgets/remove_button.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);

  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        bottom: 15.0,
        start: 10.0,
        end: 10.0,
      ),
      decoration: BoxDecoration(
          color: AppColors.lightGrey,
          border: Border.all(color: AppColors.darkGrey),
          borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(20.0),
              bottomStart: Radius.circular(20.0))),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Image(
            height: 50,
            width: 50,
            image: AssetImage(AppAssets.facebookLogo),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 5.0),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 5.0,
              children: [
                Text(
                  'Product name',
                  style: AppTextStyles().getMediumStyle(
                      color: AppColors.darkGrey, fontSize: AppFontSize.s14),
                ),
                Text(
                  '200 USD X3',
                  style: AppTextStyles().getMediumStyle(
                      color: AppColors.green, fontSize: AppFontSize.s14),
                )
              ],
            ),
          ),
          const Spacer(),
          Wrap(
            direction: Axis.vertical,
            spacing: 5.0,
            children: [
              Text(
                'Total',
                style: AppTextStyles().getMediumStyle(
                    color: AppColors.darkGrey, fontSize: AppFontSize.s14),
              ),
              Text(
                '600 USD',
                style: AppTextStyles().getBoldStyle(
                    color: AppColors.green, fontSize: AppFontSize.s14),
              ),
              RemoveButton(onTap: () {})
            ],
          ),
        ],
      ),
    );
  }
}
