import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/onboard_screen2.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({super.key});

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 84,),
              SvgPicture.asset('assets/icons/hand_rise.svg'),
              SizedBox(height: 8,),
              Text("Now, let’s get to know each other.",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor
                ),),
              SizedBox(height: 8,),
              Text("Let’s begin with light talk to break the ice and feel comfortable. Then, we’ll move on to deeper, meaningful conversations. It’s all about taking the first step to connect.",
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
