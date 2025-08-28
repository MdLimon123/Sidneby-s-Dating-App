import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/utils/statusbar_color_setup.dart';
import 'package:sindeby_dating_app/views/screen/Auth/login_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/image/image1.png",
      "text": "Don't wait anymore, find out your soul mate now",

    },
    {
      "image": "assets/image/image2.png",
      "text": "From Anywhere to You - Meet Your Match.",

    },
    {
      "image": "assets/image/image3.png",
      "text": "Discover New Faces, Create Your Love Story.",

    },


  ];

  @override
  void initState() {
    systemStatusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 55,),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image for each onboarding page
                        Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image:    DecorationImage(image: AssetImage(_onboardingData[index]["image"] ?? ""),
                                  fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 55,),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _onboardingData[index]["text"] ?? "",
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: SizedBox(
                height: 50,
                child: Stack(
                  children: [

                    AnimatedOpacity(
                      opacity: _currentPage == _onboardingData.length - 1 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(()=> LoginScreen());
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),

                    AnimatedAlign(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      alignment: _currentPage == _onboardingData.length - 1
                          ? Alignment.center
                          : Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          if (_currentPage == _onboardingData.length - 1) {
                            Get.to(()=> LoginScreen());

                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          height: 50,
                          width: _currentPage == _onboardingData.length - 1 ? 300 : 92,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF2EAED2),
                          ),
                          child: Text(
                            _currentPage == _onboardingData.length - 1
                                ? "Get Start"
                                : "Next",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
