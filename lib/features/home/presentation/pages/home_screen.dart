import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/widgets/loading_overlay.dart';
import 'package:inthekloud_shop_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:inthekloud_shop_app/features/home/presentation/widgets/app_drawer.dart';
import 'package:inthekloud_shop_app/features/home/presentation/widgets/categories_container.dart';
import 'package:inthekloud_shop_app/features/home/presentation/widgets/products_container.dart';
import 'package:inthekloud_shop_app/features/home/presentation/widgets/search_container.dart';
import 'package:inthekloud_shop_app/injection_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.green,
              ),
            );
          } else {
            return Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Home'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchContainer(),
                      CategoriesContainer(
                        onTap: (category) {
                          bloc.add(
                              GetProductsByCategoryName(category: category));
                        },
                      ),
                      Expanded(
                        child: (state is GetProductsByCategoryNameLoading)
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.green,
                                ),
                              )
                            : const ProductsContainer(),
                      ),
                    ],
                  ),
                  drawer: AppDrawer(
                    bloc: bloc,
                  ),
                ),
                if (state is UserLogoutLoading) const LoadingOverLay(),
              ],
            );
          }
        },
      ),
    );
  }
}
