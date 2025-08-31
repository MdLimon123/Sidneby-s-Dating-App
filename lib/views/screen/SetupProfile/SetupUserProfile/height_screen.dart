import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/SetupProfile/SetupUserProfile/add_photo_screen.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int currentStep = 0;

  final List<String> heights = [
    "5' 6\"",
    "5' 5\"",
    "5' 4\"",
    "5' 3\"",
    "5' 2\"",
  ];
  int selectedHeightIndex = 2;

  final List<Map<String, dynamic>> hobbies = [
    {"name": "R&B", "icon": "assets/image/m.png"},
    {"name": "Gardening", "icon": "assets/image/g.png"},
    {"name": "LGBTQ & Rights", "icon": "assets/image/l.png"},
    {"name": "Vegetarian", "icon": "assets/image/va.png"},
    {"name": "Dancing", "icon": "assets/image/da.png"},
    {"name": "Dogs", "icon": "assets/image/dg.png"},
    {"name": "Museums & galleries", "icon": "assets/image/mg.png"},
    {"name": "Wine", "icon": "assets/image/w.png"},
    {"name": "Writing", "icon": "assets/image/right.png"},
    {"name": "Yoga", "icon": "assets/image/y.png"},
    {"name": "Baking", "icon": "assets/image/b.png"},

  ];

  final searchController = TextEditingController();

  final List<String> selectedHobbies = [];

  void toggleHobby(String hobby) {
    setState(() {
      if (selectedHobbies.contains(hobby)) {
        selectedHobbies.remove(hobby);
      } else {
        selectedHobbies.add(hobby);
      }
    });
  }

  double distance = 50;

  void nextStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    } else {
      Get.to(()=>AddPhotoScreen());
    }
  }

  void skipStep() {
    nextStep();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    // ---------- Step 0 : Height ----------
    if (currentStep == 0) {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How tall are you?",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Select your height and show the world the real you — every inch is part of your story.",
            style: TextStyle(fontSize: 14, color: AppColors.textColor),
          ),
          const SizedBox(height: 30),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedHeightIndex,
                  ),
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedHeightIndex = index;
                    });
                  },
                  children: heights.map((h) {
                    return Center(
                      child: Text(
                        h,
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // Highlight Box
                IgnorePointer(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF2EAED2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    // ---------- Step 1 : Hobby ----------
    else if (currentStep == 1) {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tell us what you’re into…",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "From hiking boots to horror flicks — pick your top 5 and see who’s into it too.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 24),
          CustomTextField(
            controller: searchController,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            hintText: 'What are you into?',
          ),
          SizedBox(height: 15),
          if (selectedHobbies.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              children: selectedHobbies.map((hobby) {
                final icon = hobbies.firstWhere(
                      (element) => element["name"] == hobby,
                )["icon"];

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Chip(
                      avatar: Image.asset(icon),
                      side: BorderSide.none,
                      label: Text(
                        hobby,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    Positioned(
                      right: -6,
                      top: -6,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHobbies.remove(hobby);
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD40000),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 20),
          ],

          // Suggestion Hobbies Section
           Text(
            "You might like...",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
            color: AppColors.textColor),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: hobbies.map((item) {
                final name = item["name"];
                final icon = item["icon"];
                final isSelected = selectedHobbies.contains(name);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedHobbies.remove(name);
                      } else {
                        selectedHobbies.add(name);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.textColor,
                        width: 1
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Image.asset(icon),
                        const SizedBox(width: 6),
                        Text(
                          name,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }
    // ---------- Step 2 : Distance ----------
    else {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Customize Your Match Distance.",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600,
            color: AppColors.textColor),
          ),
          const SizedBox(height: 8),
           Text("your specific distance to find nearby matches and create red connections.",
           style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w400,
             color: AppColors.textColor
           ),),
          const SizedBox(height: 40),

          Slider(
            activeColor: AppColors.primaryColor,
            inactiveColor: Color(0xFFE0E0E0),
            value: distance,
            min: 1,
            max: 100,
            divisions: 100,
            label: "${distance.round()} km",
            onChanged: (val) {
              setState(() {
                distance = val;
              });
            },
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: 0.3,
                minHeight: 4,
                backgroundColor: Colors.black12,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 37,),
              Expanded(child: body),

              const SizedBox(height: 30),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(()=>AddPhotoScreen());
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),

                  if (currentStep == 1) //
                    Text(
                      "${selectedHobbies.length}/11 Selected",
                      style:  TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),

                  InkWell(
                    onTap: () {
                      if (currentStep == 0) {
                        debugPrint(
                          "Selected Height: ${heights[selectedHeightIndex]}",
                        );
                      }
                      nextStep();
                    },
                    child: Container(
                      height: 37,
                      width: 97,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
