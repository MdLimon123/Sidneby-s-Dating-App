import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_radio_button.dart';

class OnboardScreen5 extends StatefulWidget {
  const OnboardScreen5({super.key});

  @override
  State<OnboardScreen5> createState() => _OnboardScreen5State();
}

class _OnboardScreen5State extends State<OnboardScreen5> {

  bool isLove = false;
  bool isFriendship = false;
  bool isNetworking = false;

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
          Text("What’s your goal with this app?",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor
            ),),
          SizedBox(height: 8,),
          Text('Find love or make lifelong friends? Choose your path to connect with your people.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 30,),
          Container(
            height: 67,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE8E8E8),
                  width: 1),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Love",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor
                        ),),
                      SizedBox(height: 2,),
                      Text("Fall in love, cherish, and build forever",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor
                      ),)
                    ],
                  ),
                  Spacer(),
                  CustomRadioButton(
                      value: isLove,
                      onChanged: (val){
                        setState(() {
                          isLove = val;
                        });
                      }
                  )
                ]
            ),
          ),
          SizedBox(height: 16,),
          Container(
            height: 67,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE8E8E8),
                  width: 1),
              color: Colors.white,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Friendship",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor
                        ),),
                      SizedBox(height: 2,),
                      Text("Find your crew, share stories, and have fun.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),)
                    ],
                  ),
                  Spacer(),
                  CustomRadioButton(
                      value: isFriendship,
                      onChanged: (val){
                        setState(() {
                          isFriendship = val;
                        });
                      }
                  )
                ]
            ),
          ),
          SizedBox(height: 16,),
          Container     (
            height: 67,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE8E8E8),
                  width: 1),
              color: Colors.white,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Networking",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor
                        ),),
                      SizedBox(height: 2,),
                      Text("Network, collaborate, and achieve more.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),)
                    ],
                  ),
                  Spacer(),
                  CustomRadioButton(
                      value: isNetworking,
                      onChanged: (val){
                        setState(() {
                          isNetworking = val;
                        });
                      }
                  )
                ]
            ),
          ),
          SizedBox(height: 100,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/visibility.svg'),
              SizedBox(width: 8,),
              Expanded(
                child: Text("You’ll only be shown to people in the same mode as you.",
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

          }, text: "Next")
        ],
      ),
    );
  }
}
