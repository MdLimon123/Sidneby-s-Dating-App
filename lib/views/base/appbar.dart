import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/screen/Notification/notification_screen.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{

  final String? title;
   Appbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondaryBackgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Get.back();
            },
              child: Icon(Icons.arrow_back, color: AppColors.textColor,)),
          Text(
            title!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(()=> NotificationScreen());
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF8FDFF),
                border: Border.all(
                  color: Color(0xFF2EAED2).withValues(alpha: 0.20),
                  width: 0.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                    offset: Offset(0, 1),
                    spreadRadius: 1.5,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset('assets/icons/notification.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}