import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/helpers/route.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/Auth/email_verify_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon: Icon(Icons.arrow_back, color: AppColors.textColor,)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Text("Create your Account",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),),
          SizedBox(height: 24,),
          _headingText(
            text: 'Email',
          ),
          SizedBox(height: 4,),
          CustomTextField(controller: emailTextController,
            hintText: 'Enter your email',),
          SizedBox(height: 16,),
          _headingText(text: 'Password'),
          SizedBox(height: 4,),
          CustomTextField(
            controller: passwordTextController,
            isPassword: true,
            hintText: 'Enter your password',),
          SizedBox(height: 16,),
          _headingText(text: 'Confirm Password'),
          SizedBox(height: 4,),
          CustomTextField(
            controller: confirmPasswordController,
            isPassword: true,
            hintText: 'Re-type your password',),
          SizedBox(height: 32,),
          CustomButton(onTap: (){
            Get.to(()=> EmailVerifyScreen());
          },
              text: "Sign up"),
          SizedBox(height: 33,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFFA9A9A9),
                ),
              ),
              SizedBox(width: 7),
              Text(
                "or",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFFA9A9A9),
                ),
              ),
            ],
          ),
          SizedBox(height: 24,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFFA9A9A9),width: 1)
                  ),
                  child: Center(child: SvgPicture.asset('assets/icons/google.svg'),),
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFFA9A9A9),width: 1)
                  ),
                  child: Center(child: SvgPicture.asset('assets/icons/facebook.svg'),),
                ),
              ),
            ],
          ),
          SizedBox(height: 24,),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Already have an account?",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: " Sign in",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  _headingText({required String text}) {
    return Text(text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
      ),);
  }
}
