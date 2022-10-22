import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/enums/enums.dart';
import 'package:inthekloud_shop_app/core/extentions/extentions.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/widgets/nav_bar_icon.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductsEntity> cart = Global.userObj.cart ?? [];
    return BlocConsumer<MainLayoutBloc, MainLayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainLayoutBloc bloc = BlocProvider.of<MainLayoutBloc>(context);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            margin: const EdgeInsetsDirectional.only(bottom: 20.0),
            padding: const EdgeInsets.all(15.0),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarIcon(
                    isSelected: bloc.isSelected == NavBarItems.home,
                    icon: Icons.home,
                    text: NavBarItems.home.name,
                    onTap: () {
                      bloc.add(const ChangeNavBarSelected(
                          navBarItem: NavBarItems.home));
                    },
                  ),
                  CartWidget(
                    isEmptyCart: cart.isEmpty,
                    bloc: bloc,
                    onTap: () {
                      bloc.add(const ChangeNavBarSelected(
                          navBarItem: NavBarItems.cart));
                    },
                  ),
                ]),
          ),
        );
      },
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget(
      {Key? key,
      required this.isEmptyCart,
      required this.bloc,
      required this.onTap})
      : super(key: key);

  final bool isEmptyCart;
  final MainLayoutBloc bloc;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    if (isEmptyCart) {
      return NavBarIcon(
        isSelected: bloc.isSelected == NavBarItems.cart,
        icon: Icons.shopping_cart,
        text: NavBarItems.cart.name,
        onTap: onTap,
      );
    } else {
      return Badge(
        badgeColor: AppColors.lightGreen,
        badgeContent: Text(
          '0',
          style: AppTextStyles().getRegularStyle(
            color: AppColors.white,
          ),
        ),
        child: NavBarIcon(
          isSelected: bloc.isSelected == NavBarItems.cart,
          icon: Icons.shopping_cart,
          text: NavBarItems.cart.name,
          onTap: onTap,
        ),
      );
    }
  }
}
