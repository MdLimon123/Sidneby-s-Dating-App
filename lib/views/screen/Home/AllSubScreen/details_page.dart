import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';
import 'package:sindeby_dating_app/views/base/appbar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar:Appbar(title: '',),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image/dummay2.jpg'),
                  fit: BoxFit.cover,
                ),

              ),
            ),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF00CD07)
                ),
              ),
              SizedBox(width: 8,),
              Text("Active",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor
              ),)
            ],
          ),
          SizedBox(height: 16,),
          Text("Jhon Mandela",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
          ),),
          SizedBox(height: 4,),
          Row(
            children: [
              Text("26 Age",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor
              ),),
              SizedBox(width: 10,),
              Icon(Icons.location_on_outlined,color: AppColors.textColor,),
              SizedBox(width: 2,),
              Text("0.6 km",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor

              ),)
            ],
          ),
          SizedBox(height: 12,),
          Row(
          children: [
            _customContainer(
                backgroundColor: Color(0xFF008EFF),
                image: 'assets/image/m.png',
                text: 'R&B',
                textColor: Color(0xFF008FFF)
            ),
            SizedBox(width: 12,),
            _customContainer(
                backgroundColor: Color(0xFFFF5B77),
                image: 'assets/image/g.png',
                text: 'Gardening',
                textColor: Color(0xFFFF4F6D)
            ),
            SizedBox(width: 12,),
            _customContainer(
                backgroundColor: Color(0xFF00E6D6),
                image: 'assets/image/va.png',
                text: 'Vegetarian',
                textColor: Color(0xFF009994)
            ),
          ],
        ),
          SizedBox(height: 12,),
          Row(
            children: [

              _customContainer(
                  backgroundColor: Color(0xFF02C5A2),
                  image: 'assets/image/dg.png',
                  text: 'Dogs',
                  textColor: Color(0xFF00BFA9),
              ),
              SizedBox(width: 12,),
              _customContainer(
                  backgroundColor: Color(0xFFE500FF),
                  image: 'assets/image/da.png',
                  text: 'Dancing',
                  textColor: Color(0xFFAD00DA)
              ),


            ],
          ),
          SizedBox(height: 16,),
          _headingText(
            text: 'My bio'
          ),
          SizedBox(height: 8,),
          _subText(
            subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley."
          ),
          SizedBox(height: 16,),
          _headingText(
              text: 'Location'
          ),
          SizedBox(height: 8,),

          _subText(subTitle: "42 Elmwood Crescent, United Kingdom"),
          SizedBox(height: 16,),
          _headingText(
              text: 'Education'
          ),
          SizedBox(height: 8,),
          _subText(subTitle: "University of British Columbia"),
          SizedBox(height: 16,),
          _headingText(
            text: 'I’m looking for'
          ),
          SizedBox(height: 8,),
         Row(
           children: [
             _buildContainer(
                 text: 'A long- term relationship'
             ),
             SizedBox(width: 12,),
             _buildContainer(
                 text: 'A life partner'
             )
           ],
         ),
          SizedBox(height: 12,),
          Row(
            children: [
              _buildContainer(
                  text: 'Fun, casual dates'
              ),
              SizedBox(width: 12,),
              _buildContainer(
                  text: 'Marriage'
              )
            ],
          ),
          SizedBox(height: 16,),
          _headingText(text: "Photo"),
          SizedBox(height: 8,),
          GridView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1
              ),
              itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/image/dummay2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
              }),
          SizedBox(height: 33,),
          _customButton(
            text: 'Share Profile',
            onTap: () {},
            textColor: AppColors.textColor
          ),
          SizedBox(height: 8,),
          _customButton(
              text: 'Block',
              onTap: () {},
              textColor: AppColors.textColor
          ),
          SizedBox(height: 8,),
          _customButton(
              text: 'Repot An Issue ',
              onTap: () {},
              textColor: Color(0xFFBC0000)
          ),
          SizedBox(height: 17,),
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

          SizedBox(height: 16,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 121,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/message.svg'),
                  Text("Message",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),)
                ],
              ),
            ),
          ),

          SizedBox(height: 72,)
        ]
      ),
    );
  }

   _customButton({required String text, required VoidCallback onTap, required Color textColor}) {
    return InkWell(
          onTap: onTap,
          child: Container(
            height: 37,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFFDADADA),
              width: 1),
            ),
            child: Center(
              child: Text(text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: textColor
              ),),
            ),
          ),
        );
  }

   _buildContainer({required String text}) {
    return Container(
          height: 34,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFF222222), width: 2)
          ),
          child: Text(text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
          ),),

        );
  }

 _subText({required String subTitle}) {
    return Text(subTitle,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF787878)
        ),);
  }

   _headingText({required String text}) {
    return Text(text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor
        ),);
  }

   _customContainer({required Color backgroundColor, required String image, required String text, required Color textColor}) {
    return Container(
          height: 34,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor.withValues(alpha: 0.20)
          ),
          child: Row(
            children: [
              Image.asset(image),
              SizedBox(width: 5,),
              Text(text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor
              ),)

            ],
          ),

        );
  }
}
