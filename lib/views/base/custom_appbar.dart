import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: AppColors.textColor,
            size: 18,),
        ),
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}