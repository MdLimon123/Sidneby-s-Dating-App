import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/models/notification_model.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  Map<DateTime, List<NotificationModel>> data = {};


  @override
  void initState() {
    populateData();
    super.initState();
  }

  void populateData() {
    final l = [
      NotificationModel(
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      NotificationModel(
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];

    for (var i in l) {
      final key = DateTime(
        i.createdAt.year,
        i.createdAt.month,
        i.createdAt.day,
      );

      if (data.containsKey(key)) {
        data[key]!.add(i);
      } else {
        data[key] = [i];
      }
    }
  }

  List<Widget> getNotifications(Map<DateTime, List<dynamic>> data) {
    List<Widget> rtn = [];

    final sortedKeys = data.keys.toList()..sort((a, b) => b.compareTo(a));

    for (var i in sortedKeys) {
      rtn.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              formatDate(i),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
      for (var j in data[i]!) {
        rtn.add(NotificationWidget(item: j));
      }
    }

    return rtn;
  }

  String formatDate(DateTime t) {
    final now = DateTime.now();
    final List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    if (t.year == now.year && t.month == now.month && t.day == now.day) {
      return "Today";
    } else if (t.year == now.year &&
        t.month == now.month &&
        now.day - t.day == 1) {
      return "Yesterday";
    } else if (t.year == now.year &&
        t.month == now.month &&
        t.day - now.day == 1) {
      return "Tomorrow";
    } else {
      return "${t.day} ${months[t.month - 1]} ${t.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackgroundColor,
        leading: InkWell(onTap:(){
          Get.back();
        },child: Icon(Icons.arrow_back, color: AppColors.textColor,)),
        title: Text("Notification",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),),
        centerTitle: true,

      ),
      body: Column(
        children: getNotifications(data),
      ),
    );
  }
}
