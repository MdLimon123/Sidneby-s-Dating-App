import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/utils/statusbar_color_setup.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/onboard_screen2.dart';

class OnboardScreen1 extends StatefulWidget {
  const OnboardScreen1({super.key});

  @override
  State<OnboardScreen1> createState() => _OnboardScreen1State();
}

class _OnboardScreen1State extends State<OnboardScreen1> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/victory.svg'),
            SizedBox(height: 8,),
            Text("Made for you, Not just anyone.",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor
            ),),
            SizedBox(height: 8,),
            Text("Everything we do is to help you get exactly what you’re looking for.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
            ),),
            Spacer(),
            CustomButton(onTap: (){
              Get.to(()=> OnboardScreen2());
            },
                text:"Continue"),
            SizedBox(height: 24,),
            Center(
              child: Text("Make changes in device settings at any time",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor
              ),
              textAlign: TextAlign.center,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Learn more in our.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),
                ),
                Text("Privacy policy",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor
                ),)
              ],
            )
          ]
        ),
      ),
    );
  }
}
