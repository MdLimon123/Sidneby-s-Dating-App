import 'package:flutter/material.dart';
import 'package:sindeby_dating_app/models/notification_model.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';

class NotificationWidget extends StatefulWidget {
  final NotificationModel item;
  const NotificationWidget({super.key, required this.item});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical:5),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFEDEDED),
          width: 1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/image/dummay2.jpg'),
                fit: BoxFit.cover))

            ),
            SizedBox(width: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tacos al Pastor",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
                )),
                SizedBox(height: 4,),
                Text("13 minuets ago",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF696969)
                ),)
              ],
            ),
            SizedBox(width: 6,),
            Text("like you",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8C8C8C)
            ),),
            SizedBox(width: 40,),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00CD07)
              ),
            )
          ],
        ),
      ),
    );
  }
}
