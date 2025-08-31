
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/helpers/route.dart';
import 'package:sindeby_dating_app/utils/app_icons.dart';


import '../../utils/app_colors.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;

  const BottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.primaryColor : theme.disabledColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding: const EdgeInsets.only(top:8),
          child: SvgPicture.asset(
            image,
            height: 24.0,
            width: 24.0,
            color: colorByIndex(theme, index),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(AppIcons.homeIcon, 'Home', theme, 0),
      getItem(AppIcons.exploreIcon, 'Explore', theme, 1),
      getItem(AppIcons.favoriteIcon, 'Like You', theme, 2),
      getItem(AppIcons.chatIcon, 'Chat', theme, 3),
      getItem(AppIcons.profileIcon, 'Profile', theme, 4),
    ];

    return Container(

      decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
                color:Color(0xFF2EAED2).withValues(alpha: .20),
                offset: Offset(0,-4),
                spreadRadius:0,
                blurRadius: 9)
          ]
      ),
      child: ClipRRect(

        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          
          selectedItemColor:Theme.of(context).primaryColor,
          currentIndex: menuIndex,
          
          onTap: (value) {
            switch (value) {
              case 0:
                Get.offAndToNamed(AppRoutes.homeScreen);
                break;
              case 1:
                Get.offAndToNamed(AppRoutes.exploreScreen);
                break;
              case 2:
                Get.offAndToNamed(AppRoutes.favoriteScreen);
                break;
              case 3:
                Get.offAndToNamed(AppRoutes.inboxScreen);
              break;
              case 4:
                Get.offAndToNamed(AppRoutes.profileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}