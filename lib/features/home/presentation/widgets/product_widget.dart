import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/home/presentation/widgets/add_to_cart_button.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.product,
    required this.onTap,
    required this.onAddToCartTap,
  }) : super(key: key);

  final ProductsEntity product;
  final void Function() onTap;
  final void Function(int length) onAddToCartTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(20.0),
                  bottomStart: Radius.circular(20.0)),
              border: Border.all(
                color: AppColors.green,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Image(
                    image: NetworkImage(product.images![0]),
                    height: 100.0,
                  ),
                ),
                Text(
                  product.title ?? '',
                  style: AppTextStyles().getRegularStyle(
                      color: AppColors.darkGrey, fontSize: AppFontSize.s16),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(
                  thickness: 2.0,
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ ',
                    style: AppTextStyles().getSemiBoldStyle(
                        color: AppColors.darkGrey, fontSize: AppFontSize.s16),
                    children: <TextSpan>[
                      TextSpan(
                          text: '${product.price} USD',
                          style: AppTextStyles().getBoldStyle(
                              color: AppColors.green,
                              fontSize: AppFontSize.s16)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: AddToCardButton(
                    product: product,
                    onTap: (length) => onAddToCartTap(length),
                  ),
                )
              ],
            ),
          ),
        ),
        if (product.discountPercentage! > 0)
          PositionedDirectional(
            top: -10.0,
            start: -10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                '${product.discountPercentage!.round()} %',
                style: AppTextStyles().getRegularStyle(
                    color: AppColors.white, fontSize: AppFontSize.s14),
              ),
            ),
          ),
      ],
    );
  }
}
