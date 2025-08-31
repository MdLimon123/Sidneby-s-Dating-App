import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/bottom_menu..dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> images = [
    '', // First slot for Add Story
    'assets/image/dummy.png',
    'assets/image/dummy.png',
    'assets/image/dummy.png',
    'assets/image/dummy.png',
  ];

  final List<String> stories = [
    "assets/image/dummy.png",
    "assets/image/dummay2.jpg",
    "assets/image/dummy.png",
  ];

  int currentIndex = 0;
  double progressValue = 0.0;
  Timer? timer;

  double _dragDx = 0.0;
  bool _handledThisGesture = false;

  @override
  void initState() {
    super.initState();
    _dragDx = 0;
    _handledThisGesture = false;
    startProgress();
  }

  void startProgress() {
    timer?.cancel();
    progressValue = 0.0;
    timer = Timer.periodic(Duration(milliseconds: 100), (t) {
      setState(() {
        progressValue += 0.02;
        if (progressValue >= 1.0) {
          progressValue = 1.0;
          t.cancel();
          nextStory();
        }
      });
    });
  }

  void nextStory() {
    if (currentIndex < stories.length - 1) {
      setState(() {
        currentIndex++;
      });
      startProgress();
    } else {

      setState(() {
        currentIndex = 0;
      });
      startProgress();
    }
  }

  void previousStory() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      startProgress();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: _customAppbar(),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [

          /// add story
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                bool isAddStory = index == 0;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isAddStory) {
                            print("Add Story tapped");
                          } else {
                            print("View Story tapped: $index");
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF2EAED2).withValues(alpha: 0.36),
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: isAddStory
                                ? Center(
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: AppColors.textColor,
                              ),
                            )
                                : Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        isAddStory ? "Add Story" : ["Olivia","Dayssi","Amiliva","Sophia"][index-1],
                        style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16,),
          Text("Near You",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),),
          SizedBox(height: 12,),

          /// Story View
          SizedBox(
            height: 400,
            child: GestureDetector(
                onPanStart: (_) {
                  _dragDx = 0;
                  _handledThisGesture = false;
                },
                onPanUpdate: (details) {

                  _dragDx += details.delta.dx;
                },
                onPanEnd: (_) {
                  if (_handledThisGesture) return;

                  const double threshold = 40;
                  if (_dragDx.abs() < threshold) return;

                  _handledThisGesture = true;


                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (_dragDx < 0) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("👍 Liked"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                  } else {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("👎 Disliked"),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                  }
                },

                onTapDown: (details) {
                  final width = MediaQuery.of(context).size.width;
                  if (details.globalPosition.dx < width / 2) {
                    previousStory();
                  } else {
                    nextStory();
                  }
                },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(stories[currentIndex]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                  // Progress bar
                  Positioned(
                    top: 20,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: List.generate(stories.length, (index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: LinearProgressIndicator(
                              value: index == currentIndex
                                  ? progressValue
                                  : (index < currentIndex ? 1 : 0),
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2EAED2)),
                              minHeight: 4,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  // Bottom Info Card
                  Positioned(
                    bottom: 20,
                    left: 10,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, color: Color(0xFF00CD07), size: 12),
                            SizedBox(width: 4),
                            Text(
                              "Active",
                              style: TextStyle(color: Colors.white, fontSize: 12,
                              fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Jhon Mandela",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          spacing: 8,
                          children: [

                            Container(
                              height: 26,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white, width: 1)
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/image/w.png'),
                                  SizedBox(width: 5,),
                                  Text("Wine",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              height: 26,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white, width: 1)
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/image/g.png'),
                                  SizedBox(width: 5,),
                                  Text("Gardening",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),)
                                ],
                              ),
                            ),
                            Container(
                              height: 26,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white, width: 1)
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/image/c.png'),
                                  SizedBox(width: 5,),
                                  Text("Coffee",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),)
                                ],
                              ),
                            ),
                            


                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )

        ]
      ),
      bottomNavigationBar: BottomMenu(0),
    );
  }

   _customAppbar() {
    return AppBar(
      backgroundColor: AppColors.secondaryBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hey, Glad You’re Here",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),),
              Text("Johnson Mate",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4B4B4B)
              ),)
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF8FDFF),
              border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.20),width: 0.3),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                  offset: Offset(0,1),
                  spreadRadius: 1.5,
                  blurRadius: 2
                )
              ]
            ),
            child: Center(child: SvgPicture.asset('assets/icons/notification.svg'),),
          )
        ],
      ),
    );
  }
}
