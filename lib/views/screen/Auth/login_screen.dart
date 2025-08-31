import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/helpers/route.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/Auth/forget_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool isRemember = false;

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
          Text("Login to your Account",
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
          SizedBox(height: 12,),
          Row(
            children: [
              Checkbox(
                  value: isRemember,
                  activeColor: AppColors.primaryColor,
                  onChanged: (value){
                    setState(() {
                      isRemember = value!;
                    });
                  }),
              Text('Remember me',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),),
              Spacer(),
              InkWell(
                onTap: (){
                  Get.to(()=> ForgetScreen());
                },
                child: Text('Forgot Password?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),),
              ),
            ],
          ),
          SizedBox(height: 32,),
          CustomButton(onTap: (){
            Get.offAllNamed(AppRoutes.homeScreen);
          },
              text: "Login"),
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
                text: "Don’t have an account?",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: " Sign up",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAllNamed(AppRoutes.signupScreen);
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
