import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sindeby_dating_app/models/story.dart';
import 'package:sindeby_dating_app/views/screen/Home/AllSubScreen/my_story_viewer.dart';
import 'package:sindeby_dating_app/views/screen/Home/AllSubScreen/others_story_viewer.dart';

class HomeController extends GetxController{

  final ImagePicker _picker = ImagePicker();

  var currentIndex = 0.obs;
  var progressValue = 0.0.obs;

  Timer? timer;

  double dragDx = 0.0;
  Rxn<Story> myStory = Rxn<Story>();
  bool _handledThisGesture = false;

  final List<String> stories = [
    "assets/image/dummy.png",
    "assets/image/dummay2.jpg",
    "assets/image/dummy.png",
  ];

  RxList<Story> others = <Story>[
    Story(userName: "Olivia",  mediaPaths: ["assets/image/dummy.png"]),
    Story(userName: "Dayssi",  mediaPaths: ["assets/image/dummy.png"]),
    Story(userName: "Amiliva", mediaPaths: ["assets/image/dummy.png"]),
    Story(userName: "Sophia",  mediaPaths: ["assets/image/dummy.png"]),
  ].obs;


  RxInt currentMediaIndex = 0.obs;
  RxInt currentUserIndex  = 0.obs;


  /// pick image with gallery
  Future<void> pickAndCreateMyStory() async {
    final files = await _picker.pickMultiImage(imageQuality: 85);
    if (files.isEmpty) return;

    myStory.value = Story(
      userName: "You",
      mediaPaths: files.map((e) => e.path).toList(),
      isMe: true,
    );

    currentMediaIndex.value = 0;

    if (others.isNotEmpty) {
      currentUserIndex.value = 0;
      currentMediaIndex.value = 0;

    }
  }

/// next in my story
  void nextInMyStory(BuildContext context) {
    final story = myStory.value!;
    if (currentMediaIndex.value < story.mediaPaths.length - 1) {
      currentMediaIndex.value++;
    } else {
      Get.back();
    }
  }

  /// prev in my story
  void prevInMyStory() {
    if (currentMediaIndex.value > 0) {
      currentMediaIndex.value--;
    }
  }

  /// next in others
  void nextInOthers() {
    final s = others[currentUserIndex.value];
    if (currentMediaIndex.value < s.mediaPaths.length - 1) {
      currentMediaIndex.value++;
    } else {

      if (currentUserIndex.value < others.length - 1) {
        currentUserIndex.value++;
        currentMediaIndex.value = 0;
      } else {
        Get.back();
      }
    }
  }

  /// prev in others
  void prevInOthers() {
    if (currentMediaIndex.value > 0) {
      currentMediaIndex.value--;
    } else if (currentUserIndex.value > 0) {
      currentUserIndex.value--;
      currentMediaIndex.value = others[currentUserIndex.value].mediaPaths.length - 1;
    }
  }



  @override
  void onInit() {
    super.onInit();
    dragDx = 0;
    _handledThisGesture = false;
    startProgress();
  }

  /// start progress with body image story
  void startProgress() {
    timer?.cancel();
    progressValue.value = 0.0;
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      progressValue.value += 0.02;
      if (progressValue.value >= 1.0) {
        progressValue.value = 1.0;
        t.cancel();
        nextStory();
      }
    });
  }
/// set next story
  void nextStory() {
    if (currentIndex.value < stories.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    startProgress();
  }

  void previousStory() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      startProgress();
    }
  }

  void resetGesture() {
    dragDx = 0;
    _handledThisGesture = false;
  }

  bool handleGesture(double dx) {
    dragDx += dx;
    return dragDx.abs() >= 40;
  }

  bool consumeGesture() {
    if (_handledThisGesture) return false;
    _handledThisGesture = true;
    return true;
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }


}



