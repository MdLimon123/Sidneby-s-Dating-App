import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/controllers/others_story_controller.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/appbar.dart';
import 'package:sindeby_dating_app/views/base/custom_appbar.dart';

class OthersStoryViewer extends StatefulWidget {
  const OthersStoryViewer({super.key});

  @override
  State<OthersStoryViewer> createState() => _OthersStoryViewerState();
}

class _OthersStoryViewerState extends State<OthersStoryViewer> {

  final _othersStoryController = Get.put(OthersStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: Appbar(title: "Story"),
      body: Obx((){
        final path = _othersStoryController.myStories[_othersStoryController.currentIndex.value];
        final isAsset = path.startsWith("assets/");
        return Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    // ===== ROUNDED STORY CARD =====
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.76,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [BoxShadow(
                            color: Colors.black26, blurRadius: 14, offset: Offset(0, 8),
                          )],
                        ),
                        child: Stack(
                          children: [
                            // image
                            Positioned.fill(
                              child: isAsset
                                  ? Image.asset(path, fit: BoxFit.cover)
                                  : Image.file(File(path), fit: BoxFit.cover),
                            ),

                            // gradient overlay
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                    stops: const [0.0, 0.22, 0.78, 1.0],
                                    colors: [
                                      Colors.black.withValues(alpha: 0.55),
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black.withValues(alpha: 0.65),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // tap zones (prev/next)
                            Positioned.fill(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: _othersStoryController.prevStory,
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: _othersStoryController.nextStory,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // top segmented progress
                            Positioned(
                              top: 8, left: 10, right: 10,
                              child: const _StoryProgressBar(),
                            ),

                            // top bar (avatar + name + time + close)
                            Positioned(
                              top: 12, left: 12, right: 8,
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    backgroundImage: AssetImage("assets/image/dummy.png"),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _othersStoryController.userName.value,
                                        style: const TextStyle(
                                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        _othersStoryController.timeAgo.value,
                                        style:  TextStyle(color: Color(0xFFA7A7A7), fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  PopupMenuButton(
                                      color: Color(0xFFD9D9D9),
                                      onSelected: (value) {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem(
                                              onTap: () {

                                              },
                                              value: 'account ',
                                              child: Text(
                                                'Block account ',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.textColor,
                                                ),
                                              )),
                                          PopupMenuItem(
                                              onTap: () {

                                              },
                                              value: 'Report profile',
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [

                                                  Text(
                                                    'Report profile',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.textColor,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ];
                                      })



                                ],
                              ),
                            ),

                          
                          ],
                        ),
                      ),
                    ),


                    const SizedBox(height: 16),
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
              ),
            ),
          ],
        );
      })
    );
  }
}

class _StoryProgressBar extends StatelessWidget {
  const _StoryProgressBar();

  @override
  Widget build(BuildContext context) {
    final c = Get.find<OthersStoryController>();
    const barH = 4.0, gap = 6.0;

    return Obx(() => Row(
      children: List.generate(c.myStories.length, (i) {
        final isCurrent = i == c.currentIndex.value;
        final isPast = i < c.currentIndex.value;

        return Expanded(
          child: Container(
            height: barH,
            margin: EdgeInsets.symmetric(horizontal: gap / 2),
            decoration: BoxDecoration(
              color: Colors.white, // track
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                if (isPast)
                  Positioned.fill(child: Container(color: Colors.white)),
                if (isCurrent)
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: c.progress.value.clamp(0.0, 1.0),
                    child: Container(color: const Color(0xFF2EAED2)),
                  ),
              ],
            ),
          ),
        );
      }),
    ));
  }
}
