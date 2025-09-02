import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_radio_button.dart';

class ReportAnIssueScreen extends StatefulWidget {
  const ReportAnIssueScreen({super.key});

  @override
  State<ReportAnIssueScreen> createState() => _ReportAnIssueScreenState();
}

class _ReportAnIssueScreenState extends State<ReportAnIssueScreen> {

  final List<bool> _value = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.close,
              color: AppColors.textColor,),
            ),
            SizedBox(height: 8,),
            Text("Repot An Issue",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 8,),
            Text("Don't worry, your feedback is anonymous and they won't know that you've blocked orreported them.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor

            ),),
            SizedBox(height: 48,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Profile is fake",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor
                ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[0],
                    onChanged: (val){
                      setState(() {
                        _value[0] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 16,),
            _customDivider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Inappropriate messages",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[1],
                    onChanged: (val){
                      setState(() {
                        _value[1] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 16,),
            _customDivider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Harassment or bullying",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[2],
                    onChanged: (val){
                      setState(() {
                        _value[2] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 16,),
            _customDivider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Harassment or bullying",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[3],
                    onChanged: (val){
                      setState(() {
                        _value[3] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 16,),
            _customDivider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Offensive content",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[4],
                    onChanged: (val){
                      setState(() {
                        _value[4] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Technical problem",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[5],
                    onChanged: (val){
                      setState(() {
                        _value[5] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 16,),
            _customDivider(),
            SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textColor
                  ),
                ),
                SizedBox(width: 10,),
                Text("Other issue",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                CustomRadioButton(
                    value: _value[6],
                    onChanged: (val){
                      setState(() {
                        _value[6] = val;
                      });

                    })
              ],
            ),
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(onTap: (){}, text: "Submit"),
            )


          ],
        ),
      ),
    );
  }

   _customDivider() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 1,
              color: Color(0xFFE0E0E0),
            ),
          );
  }
}
