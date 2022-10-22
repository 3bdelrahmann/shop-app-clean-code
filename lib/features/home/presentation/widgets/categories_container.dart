import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/home/presentation/bloc/home_bloc.dart';

class CategoriesContainer extends StatefulWidget {
  const CategoriesContainer({Key? key}) : super(key: key);

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
        if (state is HomeInitial) {
          bloc.add(const GetCategories());
        }
        return Container(
          padding: const EdgeInsetsDirectional.only(start: 15.0, top: 15.0),
          child: Wrap(
            children: [
              Text(
                'Category',
                style: AppTextStyles().getBoldStyle(
                    color: Colors.grey.shade600, fontSize: AppFontSize.s16),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Wrap(
                  children: List.generate(
                      bloc.categoriesList.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              child: Text(
                                'product',
                                style: AppTextStyles().getSemiBoldStyle(
                                    color: (selectedIndex == index)
                                        ? AppColors.white
                                        : AppColors.green,
                                    fontSize: AppFontSize.s16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: (selectedIndex == index)
                                      ? AppColors.green
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: AppColors.green)),
                            ),
                          )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
