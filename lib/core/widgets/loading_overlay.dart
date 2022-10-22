import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';

class LoadingOverLay extends StatelessWidget {
  const LoadingOverLay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black26,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.green,
        ),
      ),
    );
  }
}
