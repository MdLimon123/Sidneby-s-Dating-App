import 'package:flutter/material.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  final emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        children: [
          Text("Forget Password",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor
          ),),
          SizedBox(height: 24,),
      Text('Email',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),),
          SizedBox(height: 4,),
          CustomTextField(controller: emailTextController,
          hintText: 'Enter your email',),
          SizedBox(height: 32,),
          CustomButton(onTap: (){},
              text: "Send OTP")
        ],
      ),
    );
  }
}
