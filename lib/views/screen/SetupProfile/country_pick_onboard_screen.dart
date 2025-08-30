import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/onboard_screen3.dart';

class CountryPickOnboardScreen extends StatefulWidget {
  const CountryPickOnboardScreen({super.key});

  @override
  State<CountryPickOnboardScreen> createState() => _CountryPickOnboardScreenState();
}

class _CountryPickOnboardScreenState extends State<CountryPickOnboardScreen> {

  final stateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          SizedBox(height: 37,),
          Text("Where Do You Live?",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor
          ),),
          SizedBox(height: 8,),
          Text("Add your city and country so we can connect you better.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 48,),
          Text("Country",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor)),

          SizedBox(height: 8,),

        Container(
          height: 52,
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFE8E8E8),
            width: 1),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: CountryCodePicker(
                  onChanged: (code) {
                    print("Selected Country: ${code.name}");
                  },
                  initialSelection: 'BD',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  showFlag: false,
                  showDropDownButton: false,
                  hideCloseIcon: true,
                  alignLeft: true,
                  textStyle:  TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                
                ),
              ),
              Icon(Icons.keyboard_arrow_down,
              color: Color(0xFF878787),)
            ],
          ),
        ),
          SizedBox(height: 12,),
          Text("State",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor)),
          SizedBox(height: 8,),
          CustomTextField(controller: stateTextController,
          hintText: 'Enter your state',),
          SizedBox(height: 180,),
          CustomButton(onTap: (){
            Get.to(()=> OnboardScreen3());
          },
              text: "Next")

        ]
      ),
    );
  }
}
