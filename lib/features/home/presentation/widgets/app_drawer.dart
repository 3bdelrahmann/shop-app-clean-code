import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/core/resources/app_assets.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    List<String> socialMediaIcons = [
      AppAssets.linkedinLogo,
      AppAssets.twitterLogo,
      AppAssets.facebookLogo,
    ];
    return Container(
      width: mediaQuerySize.width / 1.5,
      margin: EdgeInsetsDirectional.only(
          start: mediaQuerySize.width * 0.01,
          top: mediaQuerySize.height * 0.05,
          bottom: mediaQuerySize.height * 0.13),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: mediaQuerySize.width * 0.25,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image(
                image: NetworkImage(Global.userObj.image ?? ''),
              ),
            ),
          ),
          Text(
            '${Global.userObj.firstName} ${Global.userObj.lastName}',
            style: AppTextStyles().getSemiBoldStyle(
                color: AppColors.darkGrey, fontSize: AppFontSize.s14),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Divider(
              thickness: 1,
            ),
          ),
          DrawerStrap(
            title: 'Profile',
            icon: Icons.person_outline,
            onTap: () {},
          ),
          DrawerStrap(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {},
          ),
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              child: Text(
                'Share',
                style: AppTextStyles().getSemiBoldStyle(
                    color: AppColors.darkGrey, fontSize: AppFontSize.s16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: mediaQuerySize.width * 0.08,
                end: mediaQuerySize.width * 0.2,
                bottom: mediaQuerySize.width * 0.15,
                top: mediaQuerySize.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  socialMediaIcons.length,
                  (index) => Image(
                        image: AssetImage(socialMediaIcons[index]),
                        height: 30.0,
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerStrap extends StatelessWidget {
  const DrawerStrap(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  final IconData icon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.green,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              title,
              style: AppTextStyles().getSemiBoldStyle(
                  color: AppColors.green, fontSize: AppFontSize.s14),
            )
          ],
        ),
      ),
    );
  }
}
