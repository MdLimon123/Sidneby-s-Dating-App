import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_radio_button.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/onboard_screen5.dart';

class OnboardScreen4 extends StatefulWidget {
  const OnboardScreen4({super.key});

  @override
  State<OnboardScreen4> createState() => _OnboardScreen4State();
}

class _OnboardScreen4State extends State<OnboardScreen4> {

  bool isWoman = false;
  bool isMan = false;
  bool isNonbinary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          SizedBox(height: 15,),
          Text("Hey Morgan, glad you joined us!",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor
          ),),
          SizedBox(height: 8,),
          Text("Pick the gender that best represents you. Feel free to add more about it.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor

          ),),
          SizedBox(height: 30,),
          Text("Select your gender?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
          )),
          SizedBox(height: 12,),
      Container(
        height: 52,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE8E8E8),
          width: 1),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Text("Woman",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            Spacer(),
            CustomRadioButton(
                value: isWoman,
                onChanged: (val){
                  setState(() {
                    isWoman = val;
                  });
                }
            )
          ]
        ),
    ),
          SizedBox(height: 16,),
          Container(
            height: 52,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE8E8E8),
                  width: 1),
              color: Colors.white,
            ),
            child: Row(
                children: [
                  Text("Man",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor
                    ),),
                  Spacer(),
                  CustomRadioButton(
                      value: isMan,
                      onChanged: (val){
                        setState(() {
                          isMan = val;
                        });
                      }
                  )
                ]
            ),
          ),
          SizedBox(height: 16,),
          Container(
            height: 52,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE8E8E8),
                  width: 1),
              color: Colors.white,
            ),
            child: Row(
                children: [
                  Text("Nonbinary",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor
                    ),),
                  Spacer(),
                  CustomRadioButton(
                      value: isNonbinary,
                      onChanged: (val){
                        setState(() {
                          isNonbinary = val;
                        });
                      }
                  )
                ]
            ),
          ),
          SizedBox(height: 80,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/exclo.svg'),
              SizedBox(width: 8,),
              Expanded(
                child: Text("You Can update this later. A note about  gender On this application",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),),
              )
              
            ],
          ),
          SizedBox(height: 20,),

          CustomButton(onTap: (){
            Get.to(()=> OnboardScreen5());
          }, text: "Next")


        ],
      )
    );
  }
}
