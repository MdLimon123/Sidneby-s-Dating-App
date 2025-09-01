import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/appbar.dart';

class AddStoryScreen extends StatefulWidget {

  final String imagePath;

  const AddStoryScreen({super.key, required this.imagePath});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: Appbar(
        title: 'Add Story',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.70,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 12,),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 37,
                width: 91,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),

                ),
                child: Center(child: Text("Post",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
