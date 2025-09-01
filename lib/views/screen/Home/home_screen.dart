import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/controllers/home_controller.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/bottom_menu..dart';
import 'package:sindeby_dating_app/views/base/story_thumb.dart';
import 'package:sindeby_dating_app/views/screen/Home/AllSubScreen/details_page.dart';
import 'package:sindeby_dating_app/views/screen/Home/AllSubScreen/my_story_viewer.dart';
import 'package:sindeby_dating_app/views/screen/Home/AllSubScreen/others_story_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = Get.put(HomeController());

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
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: _customAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          /// add story
          Obx(() {
            final total =
                1 +
                (_homeController.myStory.value != null ? 1 : 0) +
                _homeController.others.length;
            return SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: total,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, idx) {
                  final hasMine = _homeController.myStory.value != null;
                  final isAdd = idx == 0;
                  final isMine = !isAdd && hasMine && idx == 1;

                  String title;
                  String? thumb;
                  if (isAdd) {
                    title = "Add Story";
                  } else if (isMine) {
                    title = "Your Story";
                    thumb = _homeController.myStory.value!.mediaPaths.first;
                  } else {
                    final other =
                        _homeController.others[idx - 1 - (hasMine ? 1 : 0)];
                    title = other.userName;
                    thumb = other.mediaPaths.first;
                  }

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (isAdd) {
                            await _homeController.pickAndCreateMyStory();
                          } else if (isMine) {
                            _homeController.currentMediaIndex.value = 0;
                            await Get.to(() => MyStoryViewer(thumb: thumb!));
                          } else {
                            _homeController.currentUserIndex.value =
                                idx - 1 - (hasMine ? 1 : 0);
                            _homeController.currentMediaIndex.value = 0;
                            await Get.to(() => OthersStoryViewer());
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF2EAED2).withOpacity(0.36),
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: isAdd
                                ? const Center(child: Icon(Icons.add, size: 30))
                                : StoryThumb(path: thumb!),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }),

          SizedBox(height: 16),
          Text(
            "Near You",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 12),

          /// Story View
          // SizedBox(
          //   height: 400,
          //   child: GestureDetector(
          //     onPanStart: (_) {
          //       _dragDx = 0;
          //       _handledThisGesture = false;
          //     },
          //     onPanUpdate: (details) {
          //       _dragDx += details.delta.dx;
          //     },
          //     onPanEnd: (_) {
          //       if (_handledThisGesture) return;
          //
          //       const double threshold = 40;
          //       if (_dragDx.abs() < threshold) return;
          //
          //       _handledThisGesture = true;
          //
          //       ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //       if (_dragDx < 0) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(
          //             content: Text("👍 Liked"),
          //             backgroundColor: Colors.green,
          //             duration: Duration(seconds: 1),
          //             behavior: SnackBarBehavior.floating,
          //           ),
          //         );
          //       } else {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(
          //             content: Text("👎 Disliked"),
          //             backgroundColor: Colors.red,
          //             duration: Duration(seconds: 1),
          //             behavior: SnackBarBehavior.floating,
          //           ),
          //         );
          //       }
          //     },
          //
          //     onTapDown: (details) {
          //       final width = MediaQuery.of(context).size.width;
          //       if (details.globalPosition.dx < width / 2) {
          //         previousStory();
          //       } else {
          //         nextStory();
          //       }
          //     },
          //     child: Stack(
          //       children: [
          //         Positioned.fill(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(12),
          //               image: DecorationImage(
          //                 image: AssetImage(stories[currentIndex]),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //         ),
          //         // Progress bar
          //         Positioned(
          //           top: 20,
          //           left: 10,
          //           right: 10,
          //           child: Row(
          //             children: List.generate(stories.length, (index) {
          //               return Expanded(
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(horizontal: 2),
          //                   child: LinearProgressIndicator(
          //                     value: index == currentIndex
          //                         ? progressValue
          //                         : (index < currentIndex ? 1 : 0),
          //                     backgroundColor: Colors.white,
          //                     valueColor: AlwaysStoppedAnimation<Color>(
          //                       Color(0xFF2EAED2),
          //                     ),
          //                     minHeight: 4,
          //                     borderRadius: BorderRadius.circular(12),
          //                   ),
          //                 ),
          //               );
          //             }),
          //           ),
          //         ),
          //         // Bottom Info Card
          //         Positioned(
          //           bottom: 20,
          //           left: 10,
          //           right: 20,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   Icon(
          //                     Icons.circle,
          //                     color: Color(0xFF00CD07),
          //                     size: 12,
          //                   ),
          //                   SizedBox(width: 4),
          //                   Text(
          //                     "Active",
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(height: 5),
          //               Text(
          //                 "Jhon Mandela",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 32,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //               SizedBox(height: 10),
          //               Row(
          //                 spacing: 8,
          //                 children: [
          //                   Container(
          //                     height: 26,
          //                     padding: EdgeInsets.symmetric(horizontal: 12),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(12),
          //                       border: Border.all(
          //                         color: Colors.white,
          //                         width: 1,
          //                       ),
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Image.asset('assets/image/w.png'),
          //                         SizedBox(width: 5),
          //                         Text(
          //                           "Wine",
          //                           style: TextStyle(
          //                             fontSize: 12,
          //                             fontWeight: FontWeight.w500,
          //                             color: Colors.white,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Container(
          //                     height: 26,
          //                     padding: EdgeInsets.symmetric(horizontal: 12),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(12),
          //                       border: Border.all(
          //                         color: Colors.white,
          //                         width: 1,
          //                       ),
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Image.asset('assets/image/g.png'),
          //                         SizedBox(width: 5),
          //                         Text(
          //                           "Gardening",
          //                           style: TextStyle(
          //                             fontSize: 12,
          //                             fontWeight: FontWeight.w500,
          //                             color: Colors.white,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Container(
          //                     height: 26,
          //                     padding: EdgeInsets.symmetric(horizontal: 12),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(12),
          //                       border: Border.all(
          //                         color: Colors.white,
          //                         width: 1,
          //                       ),
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Image.asset('assets/image/c.png'),
          //                         SizedBox(width: 5),
          //                         Text(
          //                           "Coffee",
          //                           style: TextStyle(
          //                             fontSize: 12,
          //                             fontWeight: FontWeight.w500,
          //                             color: Colors.white,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 400,
            child: GestureDetector(
              onPanStart: (_) => _homeController.resetGesture(),
              onPanUpdate: (details) {
                _homeController.handleGesture(details.delta.dx);
              },
              onPanEnd: (_) {
                if (!_homeController.consumeGesture()) return;

                if (_homeController.dragDx <- 100) {
                  // 👉 Right swipe = Like
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("👍 Liked"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  _homeController.nextStory();
                } else if (_homeController.dragDx > 100) {
                  // 👉 Left swipe = Dislike
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("👎 Disliked"),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  _homeController.nextStory(); // ⬅️ next image e jabe
                }

                // Reset card position after swipe
                _homeController.resetGesture();
              },
              onTapDown: (details) {
                final width = MediaQuery.of(context).size.width;
                if (details.globalPosition.dx < width / 2) {
                  _homeController.previousStory();
                } else {
                  _homeController.nextStory();
                }
              },
              child: Obx(() {
                double dx = _homeController.dragDx;

                return Transform.translate(
                  offset: Offset(dx, 0),
                  child: Transform.rotate(
                    angle: dx * 0.002, // tilt effect
                    child: Stack(
                      children: [
                        // Image
                        Positioned.fill(
                          child: InkWell(
                            onTap: () {
                           Get.to(()=> DetailsPage());
                  },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                    _homeController
                                        .stories[_homeController.currentIndex.value],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Progress bar (unchanged)
                        Positioned(
                          top: 20,
                          left: 10,
                          right: 10,
                          child: Obx(
                                () => Row(
                              children: List.generate(
                                _homeController.stories.length,
                                    (index) {
                                  return Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                      child: LinearProgressIndicator(
                                        value: index ==
                                            _homeController.currentIndex.value
                                            ? _homeController.progressValue.value
                                            : (index <
                                            _homeController.currentIndex.value
                                            ? 1
                                            : 0),
                                        backgroundColor: Colors.white,
                                        valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF2EAED2),
                                        ),
                                        minHeight: 4,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        // Bottom Info Card (unchanged)
                        Positioned(
                          bottom: 20,
                          left: 10,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.circle,
                                      color: Color(0xFF00CD07), size: 12),
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
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildTag("assets/image/w.png", "Wine"),
                                  const SizedBox(width: 5),
                                  buildTag("assets/image/g.png", "Gardening"),
                                  const SizedBox(width: 5),
                                  buildTag("assets/image/c.png", "Coffee"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )

        ],
      ),
      bottomNavigationBar: BottomMenu(0),
    );
  }

  buildTag(String asset, String text) {
    return Container(
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          Image.asset(asset, height: 16, width: 16),
          const SizedBox(width: 3),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
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
              Text(
                "Hey, Glad You’re Here",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
              Text(
                "Johnson Mate",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4B4B4B),
                ),
              ),
            ],
          ),
          Container(
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
        ],
      ),
    );
  }
}
