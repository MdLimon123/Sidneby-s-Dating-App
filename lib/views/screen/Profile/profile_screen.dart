import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_switch.dart';
import 'package:sindeby_dating_app/views/screen/Notification/notification_screen.dart';
import 'package:sindeby_dating_app/views/screen/Profile/AllSubScreen/edit_profile_screen.dart';
import 'package:sindeby_dating_app/views/screen/Profile/AllSubScreen/subscription_screen.dart';

import '../../base/bottom_menu..dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

    bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [

          Center(
            child: Container(
              height: 92,
              width: 92,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF2EAED2), width: 2),
                image: DecorationImage(image: AssetImage('assets/image/dummay2.jpg'))
              ),
              
            ),
          ),
          SizedBox(height: 8,),
          Center(
            child: Text("Tacos al Pastor",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),),
          ),
          SizedBox(height: 32,),
          
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xFFE9E9E9),
              width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  _customContainer(
                    onTap: (){
                      Get.to(()=> EditProfileScreen());
                    },
                    imagePath: 'assets/icons/person.svg',
                    text: 'Profile Update'
                  ),
                  SizedBox(height: 16,),
                  _customContainer(
                    onTap: (){
                      Get.to(()=> SubscriptionScreen());
                    },
                      imagePath: 'assets/icons/subscription.svg',
                      text: 'Subscription'
                  ),
                  SizedBox(height: 16,),
                  _customContainer(
                    onTap: (){},
                      imagePath: 'assets/icons/password.svg',
                      text: 'Password Change'
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.20), width: 0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/notification_fill.svg'),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Text("Notification",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor
                        ),),
                      Spacer(),
                      CustomSwitch(
                          value: isSwitch,
                          onChanged:(val){
                            setState(() {
                              isSwitch = val;
                            });
                          })

                    ],
                  ),
                  SizedBox(height: 16,),
                  InkWell(
                    onTap: (){
                      showLogoutBottomSheet(context);
                    },
                    child: Row(
                      children: [

                        Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.20), width: 0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/icons/logout.svg'),
                            ),
                          ),

                        SizedBox(width: 12,),
                        Text("Log Out",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFD40000)
                          ),),
                        Spacer(),
                        Icon(Icons.navigate_next, size: 24, color: AppColors.textColor,)

                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

        ]
      ),
      bottomNavigationBar: BottomMenu(4),
    );
  }

   _customContainer({required String imagePath,
   required String text,
   required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.20), width: 0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(imagePath),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Text(text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor
                      ),),
                      Spacer(),
                      Icon(Icons.navigate_next, size: 24, color: AppColors.textColor,)

                    ],
                  ),
    );
  }

  _customAppbar() {
    return AppBar(
      backgroundColor: AppColors.secondaryBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
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


    showLogoutBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        builder: (context) {
          return InkWell(
            onTap: (){
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Color(0xFFD40000),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    width: double.maxFinite,
                    height: 0.5,
                    color: AppColors.textColor
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Are you sure you want to log out?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF444446),
                        fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text("Thank you and see you again!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                    fontSize: 14
                  ),),
                  SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){



                          },
                          child: Container(
                            height: 48,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.primaryColor)
                            ),
                            child: Text("Cancel",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),

                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.primaryColor
                            ),
                            child: Text("Yes, Logout",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)
                              ),),
                          ),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      );
    }

}
