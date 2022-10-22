import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:inthekloud_shop_app/features/home/presentation/pages/home_screen.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/widgets/nav_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainLayoutBloc(),
      child: BlocConsumer<MainLayoutBloc, MainLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MainLayoutBloc bloc = BlocProvider.of<MainLayoutBloc>(context);
          return Scaffold(
              extendBody: true,
              body: PageView(
                controller: bloc.pageController,
                children: const [
                  HomeScreen(),
                  CartScreen(),
                ],
              ),
              bottomNavigationBar: CustomNavBar());
        },
      ),
    );
  }
}
