import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_switch.dart';

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
                    imagePath: 'assets/icons/person.svg',
                    text: 'Profile Update'
                  ),
                  SizedBox(height: 16,),
                  _customContainer(
                      imagePath: 'assets/icons/subscription.svg',
                      text: 'Subscription'
                  ),
                  SizedBox(height: 16,),
                  _customContainer(
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
   required String text}) {
    return Row(
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
          Container(
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
        ],
      ),
    );
  }

}
