import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/screen/Auth/reset_password_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        children: [
          Text("Verify Your OTP",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor
            ),),
          SizedBox(height: 97,),
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFFB1B1B1),
            focusedBorderColor: Color(0xFFB1B1B1),
            enabledBorderColor: Color(0xFFB1B1B1),
            showFieldAsBox: true,
            fieldWidth: 45,
            fieldHeight: 45,
            borderRadius: BorderRadius.circular(100),
            textStyle: TextStyle(
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            fillColor: Color(0xFFE6EEF7),
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {},
          ),
          SizedBox(height: 32,),
          CustomButton(onTap: (){
            Get.to(()=> ResetPasswordScreen());
          },
              text: "Verify"),
          SizedBox(height: 33,),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Don’t receive the code?",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: " Resend Now",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      },
                  ),
                ],
              ),
            ),
          ),


        ]
      ),
    );
  }
}
