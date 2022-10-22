import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:inthekloud_shop_app/features/product_details/presentation/pages/product_details_page.dart';

import 'product_widget.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
        if (state is HomeInitial) {
          // bloc.add(const GetCategories());
          bloc.add(const GetAllProducts());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0, top: 10.0),
              child: Text(
                'Products',
                style: AppTextStyles().getBoldStyle(
                    color: Colors.grey.shade600, fontSize: AppFontSize.s16),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsetsDirectional.only(
                      start: 20,
                      top: 20,
                      end: 20.0,
                      bottom: MediaQuery.of(context).size.height * 0.13),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 19 / 25,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0),
                  itemCount: bloc.productsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                      product: bloc.productsList[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductDetailsScreen(
                                    productId:
                                        bloc.productsList[index].id.toString()),
                            settings:
                                const RouteSettings(name: 'ProfileScreen'),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
