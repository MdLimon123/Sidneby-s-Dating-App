import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/SetupUserProfile/terms_and_condition_screen.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {

  final ImagePicker _picker = ImagePicker();
  List<XFile?> images = List<XFile?>.filled(6, null, growable: false);

  Future<void> pickImage(int index) async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        images[index] = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          LinearProgressIndicator(
            value: 1,
            minHeight: 5,
            backgroundColor: Color(0xFFE6EEF7),
            borderRadius: BorderRadius.circular(8),
            valueColor:  AlwaysStoppedAnimation<Color>(
                AppColors.primaryColor
            ),
          ),
          SizedBox(height: 37,),
          Text("Make your profile pop.",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor
          ),),
          SizedBox(height: 8,),
          Text("Add at least 4 photos—whether it’s you smiling with friends, chilling at home, or exploring somewhere new.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 35,),

          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(12),
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              bool hasImage = images[index] != null;

              return GestureDetector(
                onTap: () {
                  if (!hasImage) pickImage(index);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 125,
                      width: 109,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFF3F3F3),
                        border: hasImage
                            ? Border.all(
                          color: AppColors.primaryColor, // Color border for selected image
                          width: 2,
                        )
                            : null
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: hasImage
                            ? Image.file(
                          File(images[index]!.path),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                    ),

                    // Dotted border for empty slot
                    if (!hasImage)
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            strokeWidth: 2,
                            dashPattern: [4, 4],
                            color: Color(0xFFA1A1A1), 
                            radius: Radius.circular(12),
                          ),
                            child: SizedBox(),
                          )
                        ),
                      ),

                    // Main image label
                    if (index == 0 && hasImage)
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Main",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: AppColors.textColor),
                          ),
                        ),
                      ),

                    // Bottom-right icon (Add or Close)
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: GestureDetector(
                        onTap: () {
                          if (hasImage) {
                            setState(() {
                              images[index] = null;
                            });
                          } else {
                            pickImage(index);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: hasImage ? Colors.red : Colors.blue,
                          ),
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            hasImage ? Icons.close : Icons.add,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 130,),
          CustomButton(onTap: (){
            Get.to(()=> TermsAndConditionScreen());
          },
              text: "Next")

        ]
      ),
    );
  }
}
