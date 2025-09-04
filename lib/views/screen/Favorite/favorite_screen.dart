import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/bottom_menu..dart';
import 'package:sindeby_dating_app/views/screen/Favorite/favorite_details_screen.dart';
import 'package:sindeby_dating_app/views/screen/Notification/notification_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _customAppbar(),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal:20, vertical: 16 ),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: .8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(()=> FavoriteDetailsScreen());
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/image/dummay2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 5,
                  left: 10,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.circle,
                            color: Color(0xFF00CD07),
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Active",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Jhon Mandela",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(width: 2),
                          Text(
                            "1.0 km",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomMenu(2),
    );
  }


  _customAppbar() {
    return AppBar(
      backgroundColor: AppColors.secondaryBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Like You",
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
