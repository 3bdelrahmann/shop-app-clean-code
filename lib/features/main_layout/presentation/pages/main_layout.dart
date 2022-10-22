import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/features/home/presentation/pages/home_screen.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/widgets/nav_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView(
          children: [
            HomeScreen(),
          ],
        ),
        bottomNavigationBar: CustomNavBar());
  }
}
