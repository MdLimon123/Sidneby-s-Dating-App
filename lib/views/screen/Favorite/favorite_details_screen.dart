import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/controllers/home_controller.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/appbar.dart';


class FavoriteDetailsScreen extends StatefulWidget {
  const FavoriteDetailsScreen({super.key});

  @override
  State<FavoriteDetailsScreen> createState() => _FavoriteDetailsScreenState();
}

class _FavoriteDetailsScreenState extends State<FavoriteDetailsScreen> {

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: Appbar(title: 'Like You',),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          SizedBox(
            height:500,
            child: GestureDetector(
              onPanStart: (_) => _homeController.resetGesture(),
              onPanUpdate: (details) {
                _homeController.handleGesture(details.delta.dx);
              },
              onPanEnd: (_) {
                if (!_homeController.consumeGesture()) return;

                if (_homeController.dragDx <- 100) {
                  // 👉 Right swipe = Like
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text("👍 Liked"),
                  //     backgroundColor: Colors.green,
                  //     duration: Duration(seconds: 1),
                  //     behavior: SnackBarBehavior.floating,
                  //   ),
                  // );
                  _homeController.nextStory();
                }
                else if (_homeController.dragDx > 100) {
                  // 👉 Left swipe = Dislike
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text("👎 Disliked"),
                  //     backgroundColor: Colors.red,
                  //     duration: Duration(seconds: 1),
                  //     behavior: SnackBarBehavior.floating,
                  //   ),
                  // );
                  _homeController.nextStory();
                }

                //Reset card position after swipe
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
          ),
          SizedBox(height: 16,),
          Text("Potential Matches For You! ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  height: 48,
                  width: 84,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.50)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                          blurRadius: 5,
                          spreadRadius: 2.5,
                          offset: Offset(0, 1),
                        )

                      ]
                  ),
                  child: Icon(Icons.close,
                    color: AppColors.textColor,),
                ),
              ),
              SizedBox(width: 16,),
              Container(
                height: 48,
                width: 84,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.50)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                        blurRadius: 5,
                        spreadRadius: 2.5,
                        offset: Offset(0, 1),
                      )

                    ]
                ),
                child: Icon(Icons.favorite, color: AppColors.primaryColor,
                  size: 30,),
              )
            ],
          ),
        ],
      ),
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
}
