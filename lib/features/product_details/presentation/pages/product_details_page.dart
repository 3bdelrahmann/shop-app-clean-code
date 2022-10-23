import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/resources/app_assets.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:inthekloud_shop_app/injection_container.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>(),
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductDetailsBloc bloc =
              BlocProvider.of<ProductDetailsBloc>(context);

          if (state is ProductDetailsInitial) {
            bloc.add(GetProductsByID(productID: productId));
          }
          if (state is GetProductsByIDLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.green,
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                leading: const SizedBox.shrink(),
                actions: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.only(start: 40.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                              child: CarouselSlider(
                            items: const [
                              Image(
                                image: AssetImage(AppAssets.twitterLogo),
                                fit: BoxFit.cover,
                              ),
                            ],

                            //Slider Container properties
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 1,
                              autoPlayCurve: Curves.easeIn,
                              viewportFraction: 1,
                            ),
                          )),
                          const Padding(
                            padding: EdgeInsetsDirectional.only(end: 40.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${bloc.productIem.title}',
                                style: AppTextStyles().getSemiBoldStyle(
                                    color: AppColors.white,
                                    fontSize: AppFontSize.s18),
                              ),
                              Text(
                                '${bloc.productIem.price} USD',
                                style: AppTextStyles().getBoldStyle(
                                    color: AppColors.white,
                                    fontSize: AppFontSize.s18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '${bloc.productIem.description}',
                            style: AppTextStyles().getRegularStyle(
                                color: AppColors.white,
                                fontSize: AppFontSize.s16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
