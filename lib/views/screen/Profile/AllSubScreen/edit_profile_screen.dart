import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final nameTextController = TextEditingController();
  final bioTextController = TextEditingController();
  final heightTextController = TextEditingController();
  final incheTextController = TextEditingController();
  final collageNameController = TextEditingController();
  final hobbiesController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar:Appbar(title: "Profile Update",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 92,
                  width: 92,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF2EAED2), width: 2),
                    image: DecorationImage(image: AssetImage('assets/image/dummay2.jpg'),
                        colorFilter: ColorFilter.mode(
                          Colors.black.withValues(alpha: 0.5),
                          BlendMode.darken,
                        ),
                    fit: BoxFit.cover)
                  ),
                ),
                
                Positioned(
                  child: SvgPicture.asset('assets/icons/edit.svg'),
                )
              ],
            ),
          ),
          SizedBox(height: 22,),
          _headingText(
            text: "Full name"
          ),
          SizedBox(height: 8,),
          CustomTextField(controller: nameTextController,
          hintText: "Tascos al pastor",),
          SizedBox(height: 16,),
          _headingText(text: "Bio"),
          SizedBox(height: 8,),
          CustomTextField(controller: bioTextController,
          hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
          maxLines: 4,),
          SizedBox(height: 16,),
          _headingText(text: "Height"),
          SizedBox(height: 8,),
          Row(
            children: [
          Expanded(child:     CustomTextField(
            controller: heightTextController,
            hintText: "Feet",
          )),
           SizedBox(width: 13,),
           Expanded(child:    CustomTextField(
             controller: incheTextController,
             hintText: "Inch",
           )),
            ],
          ),
          SizedBox(height: 16,),
          _headingText(text: "Education"),
          SizedBox(height: 8,),
          CustomTextField(controller: collageNameController,
          hintText: "Northern University",),
          SizedBox(height: 16,),
          _headingText(text: "Hobbies"),
          SizedBox(height: 8,),
          CustomTextField(controller: hobbiesController,
          hintText: "What are you into?",),
          SizedBox(height: 15,),

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

          _headingText(text: "You might like....."),
          SizedBox(height: 12,),
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
          SizedBox(height: 47,),
          CustomButton(onTap: (){},
              text: "Update")

        ]
      ),
    );
  }

   _headingText({required String text}) {
    return Text(text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor
        ),);
  }
}
