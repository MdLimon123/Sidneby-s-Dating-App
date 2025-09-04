import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_radio_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  bool isBasic = false;
  bool isPremium =false;
  bool isVip = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackgroundColor,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back, color: AppColors.textColor,)),
        title: Text(
          "Subscription",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF97D6E8).withValues(alpha: 0.20),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Color(0xFF59DBFF),
                  width: 1)
            ),
            child: Column(
              children: [
                Center(
                  child: Text("Unlock Your Full \nExperience",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2EAED2)
                  ),
                  textAlign: TextAlign.center,),
                ),
                SizedBox(height: 12,),
                Text("Choose a plan that fits you best. All packages give you unlimited access — invest in yourself today!",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF555555)
                ),
                textAlign: TextAlign.center,),
                SizedBox(height: 24,),
                _customText(
                  text: "Unlimited power to like profiles"
                ),
                SizedBox(height: 16,),
                _customText(
                    text: "Express yourself through story posts"
                ),
                SizedBox(height: 16,),
                _customText(
                    text: "Find matches without any limits"
                ),
                SizedBox(height: 16,),
                _customText(
                    text: "Stay connected with unlimited chats"
                ),
              ],
            ),
          ),

          SizedBox(height: 32,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Color(0xFF2EAED2),
                  width: 1)
            ),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFFA3E9FF).withValues(alpha: 0.38),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.12),
                    width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset('assets/icons/star.svg'),
                  ),
                  ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Basic",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                    ),),
                    SizedBox(height: 4,),
                    Text("3 Months",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF676767)
                    ),)
                  ],
                ),
                SizedBox(width: 30,),
                Text("\$29.50",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
                ),),
                Text("\$20.50",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    decoration: TextDecoration.lineThrough
                  ),),
                SizedBox(width: 20,),
                CustomRadioButton(
                    value: isBasic,
                    onChanged: (val){
                      setState(() {
                        isBasic = val;
                      });
                    })
                
              ],
            ),
          ),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Color(0xFF2EAED2),
                    width: 1)
            ),
            child: Row(

              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Color(0xFFA3E9FF).withValues(alpha: 0.38),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.12),
                          width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset('assets/icons/dimaon.svg'),
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Premium",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    SizedBox(height: 4,),
                    Text("6 Months",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF676767)
                      ),)
                  ],
                ),
                SizedBox(width: 10,),
                Text("\$75.50",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                  ),),
                Text("\$60.50",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      decoration: TextDecoration.lineThrough
                  ),),
                SizedBox(width: 20,),
                CustomRadioButton(
                    value: isPremium,
                    onChanged: (val){
                      setState(() {
                        isPremium = val;
                      });
                    })

              ],
            ),
          ),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Color(0xFF2EAED2),
                    width: 1)
            ),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Color(0xFFA3E9FF).withValues(alpha: 0.38),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.12),
                          width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset('assets/icons/subscription.svg'),
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("VIP",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    SizedBox(height: 4,),
                    Text("1 Year",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF676767)
                      ),)
                  ],
                ),
                SizedBox(width: 50,),
                Text("\$130.5",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                  ),),
                Text("\$160.5",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      decoration: TextDecoration.lineThrough
                  ),),
                SizedBox(width: 20,),
                CustomRadioButton(
                    value: isVip,
                    onChanged: (val){
                      setState(() {
                        isVip = val;
                      });
                    })

              ],
            ),
          ),
          SizedBox(height: 33,),
          CustomButton(
              onTap: (){},
              text: "Subscribe Now")

        ],
      ),
    );
  }

   _customText({required String text}) {
    return Row(
                children: [
                  SvgPicture.asset('assets/icons/check_mark.svg'),
                  SizedBox(width: 8,),
                  Text(text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF555555)
                  ),)
                ],
              );
  }
}
