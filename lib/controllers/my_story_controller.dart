import 'dart:async';

import 'package:get/get.dart';
import 'package:sindeby_dating_app/models/view_model.dart';

class MyStoryController extends GetxController {
  final userName = "Jessi smith".obs;
  final timeAgo  = "36m ago".obs;

  final myStories = <String>[
    "assets/image/dummay2.jpg",
    "assets/image/dummay2.jpg",
    "assets/image/dummy.png",
  ].obs;

  final currentIndex = 0.obs;
  final progress     = 0.0.obs;

  final viewers = <Viewer>[
    Viewer(name: "Tacos al Pastor", avatar: "assets/image/dummy.png", distance: "1.0 km"),
    Viewer(name: "Pierogi",         avatar: "assets/image/dummy.png", distance: "1.0 km"),
    Viewer(name: "Moussaka",        avatar: "assets/image/dummy.png", distance: "1.0 km"),
    Viewer(name: "Feijoada",        avatar: "assets/image/dummy.png", distance: "1.0 km"),
    Viewer(name: "Shakshuka",       avatar: "assets/image/dummy.png", distance: "1.0 km"),
    Viewer(name: "Bilay chain",     avatar: "assets/image/dummy.png", distance: "1.0 km"),
  ].obs;

  int get viewersCount => viewers.length;

  // Timer
  Timer? _timer;
  // Progress control
  void startProgress() {
    _timer?.cancel();
    progress.value = 0.0;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (t) {
      final nxt = progress.value + 0.01; // ~5s
      if (nxt >= 1.0) {
        progress.value = 1.0;
        t.cancel();
        nextStory();
      } else {
        progress.value = nxt;
      }
    });
  }

  void stopProgress() => _timer?.cancel();

  void nextStory() {
    if (currentIndex.value < myStories.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    startProgress();
  }



  // ONE SCREEN panel toggle
  final showViewers = false.obs;
  void openViewers() {
    showViewers.value = true;
    stopProgress();
  }

  void closeViewers() {
    showViewers.value = false;
    startProgress();
  }

  void next() {
    if (currentIndex.value < myStories.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
  }

  void prevStory() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      startProgress();
    }
  }
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

}