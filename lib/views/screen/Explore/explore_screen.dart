import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/controllers/explore_controller.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/bottom_menu..dart';
import 'package:sindeby_dating_app/views/base/custom_button.dart';
import 'package:sindeby_dating_app/views/base/custom_text_field.dart';
import 'package:sindeby_dating_app/views/screen/Notification/notification_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final searchTextController = TextEditingController();

  final _exploreController = Get.put(ExploreController());

  double value = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _customAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: searchTextController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                    hintText: "Search",
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: (){
                    _showFilterBottomSheet(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF8FDFF),
                      border: Border.all(
                        color: Color(0xFF2EAED2).withValues(alpha: 0.20),
                        width: 0.3,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF2EAED2).withValues(alpha: 0.015),
                          offset: Offset(0, 1),
                          spreadRadius: 1.5,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset('assets/icons/filter_icon.svg'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            /// list of item
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: .8,
                ),
                itemBuilder: (context, index) {
                  return Stack(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(1),
    );
  }

  _customAppbar() {
    return AppBar(
      backgroundColor: AppColors.secondaryBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Explore",
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

  _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return InkWell(
          onTap: () {},
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Gender",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 10,),
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _genderOption("Male"),
                        _genderOption("Female"),
                        _genderOption("Nonbinary"),
                      ],
                    ),

                  SizedBox(height: 24,),

                  Text("Distance",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 62,),

                  Obx(() {
                    final v = _exploreController.value.value; // current slider value
                    final w = MediaQuery.of(context).size.width - 40;
                    final left = (w * (v / 200) - 25).clamp(0.0, w - 50);

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Slider(
                          min: 0,
                          max: 200,
                          value: v,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: Color(0xFFE0E0E0),
                          onChanged: (val) => _exploreController.value.value = val, // update Rx value
                        ),
                        Positioned(
                          top: -35,
                          left: left,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
                            ),
                            child: Text(
                              "${v.toStringAsFixed(0)} km",
                              style:  TextStyle(color: AppColors.textColor, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: 24,),
                  Text("Age",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: 40,),
                  Obx(() {
                    final v = _exploreController.rv.value;

                    return LayoutBuilder(builder: (ctx, cons) {
                      const pad = 12.0; // thumb padding
                      final w = cons.maxWidth - pad * 2;

                      double t(double x) => ((x - _exploreController.min) / (_exploreController.max - _exploreController.min)).clamp(0, 1);
                      final x1 = pad + w * t(v.start);
                      final x2 = pad + w * t(v.end);

                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // RangeSlider
                          SliderTheme(
                            data: SliderTheme.of(ctx).copyWith(
                              trackHeight: 4,
                              inactiveTrackColor: Color(0xFFE0E0E0),
                              activeTrackColor: AppColors.primaryColor,
                              thumbShape:
                              const RoundSliderThumbShape(enabledThumbRadius: 10),
                              overlayShape: SliderComponentShape.noOverlay,
                              rangeTrackShape:
                              const RoundedRectRangeSliderTrackShape(),
                            ),
                            child: RangeSlider(
                              min: _exploreController.min,
                              max: _exploreController.max,
                              values: v,
                              onChanged: (nv) => _exploreController.rv.value = nv,
                            ),
                          ),

                          // Start bubble
                          Positioned(
                            top: -40,
                            left: x1 - 18,
                            child: _Bubble(text: v.start.toStringAsFixed(0)),
                          ),

                          // End bubble
                          Positioned(
                            top: -40,
                            left: x2 - 18,
                            child: _Bubble(text: v.end.toStringAsFixed(0)),
                          ),
                        ],
                      );
                    });
                  }),
                  SizedBox(height: 42,),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height:48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFFBEBEBE),
                                  width: 1)
                          ),
                          child: Center(
                            child: Text("Reset",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 18,),
                      Expanded(
                        child: CustomButton(onTap: (){},
                            text: "Apply"),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Function for gender option widget
   _genderOption(String gender) {
    return InkWell(
      onTap: () {
        _exploreController.selectedGender.value = gender;
      },
      child: Obx(() => Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _exploreController.selectedGender.value == gender
              ? Color(0xFF2EAED2)
              : null,
          border: Border.all(
            color: _exploreController.selectedGender.value == gender
                ? Colors.transparent
                : Color(0xFFBEBEBE),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              color: _exploreController.selectedGender.value == gender
                  ? Colors.white
                  : AppColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      )),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Text(text, style:  TextStyle(fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor)),
        ),
        CustomPaint(size: const Size(12, 6), painter: _TipPainter()),
      ],
    );
  }
}

class _TipPainter extends CustomPainter {
  @override
  void paint(Canvas c, Size s) {
    final p = Paint()..color = Colors.white;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(s.width / 2, s.height)
      ..lineTo(s.width, 0)
      ..close();
    c.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
