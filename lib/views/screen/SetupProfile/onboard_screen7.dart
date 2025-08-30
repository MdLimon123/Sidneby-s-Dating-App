import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_checkbox.dart';
import 'package:sindeby_dating_app/views/base/custom_switch.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/SetupUserProfile/others_info_screen.dart';

class OnboardScreen7 extends StatefulWidget {
  const OnboardScreen7({super.key});

  @override
  State<OnboardScreen7> createState() => _OnboardScreen7State();
}

class _OnboardScreen7State extends State<OnboardScreen7> {

  bool isSwitch = false;
  bool isRelationship = false;
  bool isPartner = false;
  bool isDates = false;
  bool isCommitment= false;
  bool isMarriage = false;
  bool isEthic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          Text("What Are You Hoping to Find?",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor
            ),),
          SizedBox(height: 8,),
          Text('Select one or two options that best match what you’re looking for.',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor
            ),),
          SizedBox(height: 30,),
          Row(
            children: [
              CustomSwitch(
                  value: isSwitch,
                  onChanged:(val){
                    setState(() {

                      isSwitch = val;
                    });
                  }),
              SizedBox(width: 8,),
              Text("I'm open to Meeting everyone.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor
                ),)
            ],
          ),
          SizedBox(height:12,),
          _customContainer(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("A long- term relationship",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor
                    ),),
                  Spacer(),
                  CustomCheckBox(
                      value: isRelationship,
                      onChanged: (val){
                        setState(() {

                          isRelationship = val;
                        });
                      })

                ]
            )
          ),
          SizedBox(height:12,),
          _customContainer(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("A life partner",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    Spacer(),
                    CustomCheckBox(
                        value: isPartner,
                        onChanged: (val){
                          setState(() {

                            isPartner = val;
                          });
                        })

                  ]
              )
          ),
          SizedBox(height:12,),
          _customContainer(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Fun, casual dates",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    Spacer(),
                    CustomCheckBox(
                        value: isDates,
                        onChanged: (val){
                          setState(() {

                            isDates = val;
                          });
                        })

                  ]
              )
          ),
          SizedBox(height:12,),
          _customContainer(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Intimacy, without commitment",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    Spacer(),
                    CustomCheckBox(
                        value: isCommitment,
                        onChanged: (val){
                          setState(() {

                            isCommitment = val;
                          });
                        })

                  ]
              )
          ),
          SizedBox(height:12,),
          _customContainer(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Marriage",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    Spacer(),
                    CustomCheckBox(
                        value: isMarriage,
                        onChanged: (val){
                          setState(() {

                            isMarriage = val;
                          });
                        })

                  ]
              ),

          ),
          SizedBox(height:12,),
          _customContainer(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Ethical non-monogamy",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor
                    ),),
                  Spacer(),
                  CustomCheckBox(
                      value: isEthic,
                      onChanged: (val){
                        setState(() {

                          isEthic = val;
                        });
                      })

                ]
            ),

          ),

          SizedBox(height: 100,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/visibility.svg'),
              SizedBox(width: 8,),
              Expanded(
                child: Text("You'll only be shown to people looking to date your gender.",
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
            Get.to(()=> OthersScreen());
          }, text: "Next")

        ],
      ),
    );
  }

   _customContainer({required Widget child}) {
    return Container(
          height: 52,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFE8E8E8),
                width: 1),
            color: Colors.white,
          ),
          child: child,
        );
  }
}
