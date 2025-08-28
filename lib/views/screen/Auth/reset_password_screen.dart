import 'package:flutter/material.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        children: [
          Text("Reset Password",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor
            ),),
          SizedBox(height: 24,),
          Text("New Password",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),),
          SizedBox(height: 4,),
          CustomTextField(controller: newPasswordController,
          hintText: 'Enter your new password',
          isPassword: true,),
          SizedBox(height: 20,),
          Text("Confirm Password",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),),
          SizedBox(height: 4,),
          CustomTextField(controller: confirmPasswordController,
            hintText: 'Enter your confirm password',
            isPassword: true,),
          SizedBox(height: 32,),
          CustomButton(onTap: (){},
              text: "Reset Password")
        ],
      ),
    );
  }
}
