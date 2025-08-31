import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/helpers/route.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() => _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Staying Safe While You Date.",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                SizedBox(height: 17,),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an type specimen book.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),),
                SizedBox(height: 17,),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an type specimen book.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),),
                SizedBox(height: 17,),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an type specimen book.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),),


              ],
            ),
            Spacer(),
            CustomButton(onTap: (){
              Get.offAllNamed(AppRoutes.homeScreen);
            }, text: "I accept")

          ],
        ),
      ),
    );
  }
}
