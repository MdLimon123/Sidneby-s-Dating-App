import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/country_pick_onboard_screen.dart';

class OnboardScreen2 extends StatefulWidget {
  const OnboardScreen2({super.key});

  @override
  State<OnboardScreen2> createState() => _OnboardScreen2State();
}

class _OnboardScreen2State extends State<OnboardScreen2> {

  final nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          Text("Hi! Let’s begin with a quick intro.",
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
          SizedBox(height: 48,),
          Text("Your Full Name",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor

          ),),
          SizedBox(height: 8,),
          CustomTextField(controller: nameTextController,
            hintText: "Enter your name",),
          SizedBox(height: 24,),
          Text("Your Birthday",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor)),
          SizedBox(width: 8,),
          Row(
            children: [
              Expanded(
                child: CustomTextField(controller: nameTextController,

                hintText: 'Day',),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: CustomTextField(controller: nameTextController,
                hintText: 'month',),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: CustomTextField(controller: nameTextController,
                hintText: 'year',),
              ),
            ],
          ),
          SizedBox(height: 100,),
          CustomButton(onTap: (){
            Get.to(()=> CountryPickOnboardScreen());
          },
              text: "Next")

        ],
      ),
    );
  }
}
