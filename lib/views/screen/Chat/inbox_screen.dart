import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/appbar.dart';
import 'package:sindeby_dating_app/views/base/bottom_menu..dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/Chat/chat_screen.dart';
import 'package:sindeby_dating_app/views/screen/Notification/notification_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _customAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          CustomTextField(
            controller: searchTextController,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            hintText: "Search",
          ),
          SizedBox(height: 16,),
          Text("Your Matches",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),

          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Get.to(()=> ChatScreen());
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/image/dummay2.jpg'),
                              fit: BoxFit.cover,
                            ),

                          ),
                        ),
                        SizedBox(width: 12,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ethan Carter",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),),
                            Text("Hey, How are You?",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),)
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("09:03 pm",
                              style: TextStyle(
                                color: Color(0xFF8C8C8C),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                            SizedBox(height: 4,),
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF2EAED2),
                              ),
                              child: Center(
                                child: Text("10",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  );

                },
                separatorBuilder: (__, index)=> SizedBox(height: 18,),
                itemCount: 10),
          )

        ],
      ),
      bottomNavigationBar: BottomMenu(3),
    );
  }

  _customAppbar() {
    return AppBar(
      backgroundColor: AppColors.secondaryBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Chat",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(()=> NotificationScreen());
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF8FDFF),
                border: Border.all(
                  color: Color(0xFF2EAED2).withValues(alpha: 0.20),
                  width: 0.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                    offset: Offset(0, 1),
                    spreadRadius: 1.5,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset('assets/icons/notification.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
