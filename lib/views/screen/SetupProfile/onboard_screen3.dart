import 'package:flutter/material.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';

class OnboardScreen3 extends StatefulWidget {
  const OnboardScreen3({super.key});

  @override
  State<OnboardScreen3> createState() => _OnboardScreen3State();
}

class _OnboardScreen3State extends State<OnboardScreen3> {

  final educationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        children: [
       LinearProgressIndicator(
         value: 0.3,
         minHeight: 5,
         backgroundColor: Color(0xFFE6EEF7),
         borderRadius: BorderRadius.circular(8),
         valueColor:  AlwaysStoppedAnimation<Color>(
             AppColors.primaryColor
         ),
       ),
       SizedBox(height: 37,),
       Text("Tell Us About Your Educational Life.",
         style: TextStyle(
             fontSize: 36,
             fontWeight: FontWeight.w600,
             color: AppColors.textColor
         ),),
       SizedBox(height: 8,),
       Text('Your education tells part of your story — add it here.',
         style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w400,
             color: AppColors.textColor
         ),),
       SizedBox(height: 48,),
       Text("Education",
           style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w500,
               color: AppColors.textColor)),
       SizedBox(height: 8,),
       CustomTextField(controller: educationTextController,
         filColor: Colors.white,
         hintText: 'Enter your college or university',),
          SizedBox(height: 180,),

          CustomButton(onTap: (){},
              text: "Next")

        ],
      ),
    );
  }
}
