import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({super.key});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Icon(Icons.arrow_back, color: AppColors.textColor,),
      ),
      body:Column(

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/image/dummay2.jpg'),
                    fit: BoxFit.cover)

                  ),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child: Text("Ethan Carter",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),
              ),
              SizedBox(height: 5,),
              Center(
                child: Text("02:23:30",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
              )

            ],
          ),
          Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 80, bottom: 40, right: 80),
              child: Row(
                children: [
                  Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF8FDFF),
                      border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.20),
                      width: 0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                          spreadRadius: 1.5,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),

                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/volum.svg'),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFCE0000)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset('assets/icons/call.svg'),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF1F1F1),
                        border: Border.all(color: Color(0xFF2EAED2).withValues(alpha: 0.20),
                            width: 0.3),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF2EAED2).withValues(alpha: 0.15),
                            spreadRadius: 1.5,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),

                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/micro.svg'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
