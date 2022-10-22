import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class AppThemes {
  ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.green,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        centerTitle: false,
        titleSpacing: 20.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors.white,
        elevation: 0.0,
        titleTextStyle: AppTextStyles().getBoldStyle(
            color: Colors.grey.shade600, fontSize: AppFontSize.s20),
        iconTheme: IconThemeData(color: Colors.grey.shade600)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 20.0,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.lightGrey,
    ),
    textTheme: TextTheme(
      bodyText1: AppTextStyles().getSemiBoldStyle(
          color: AppColors.lightGrey, fontSize: AppFontSize.s18),
    ),
  );
}
