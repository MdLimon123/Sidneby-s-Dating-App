import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sindeby_dating_app/utils/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
                child: Icon(Icons.arrow_back, color: AppColors.textColor,)),
            SizedBox(width: 12,),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/image/dummay2.jpg'),
                fit: BoxFit.cover)
            )),
            SizedBox(width: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ethan Carter",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00CD07)
                      ),
                    ),
                    SizedBox(width: 4,),
                    Text('Active',
                    style: TextStyle(
                      color: Color(0xFF8C8C8C),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),)
                  ],
                )
              ],
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/phone.svg'),
            SizedBox(width: 10,),
            PopupMenuButton(
                color: Color(0xFFD9D9D9),
                onSelected: (value) {},
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.textColor
                ),
                itemBuilder: (BuildContext context) {
                  return [

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
                }),


            
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFF8FDFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Today",
                style: TextStyle(color: Color(0xFF666666), fontSize: 12,
                fontWeight: FontWeight.w500),
              ),
            ),

            // Messages List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: const [
              ChatBubble(
                isMe: false,
                text: "Hi. Sarthak! How are you doing?",
                showAvatar: true,
              ),
              ChatBubble(
                isMe: true,
                text: "Hi Shreya, I'm doing well. Thanks for asking!",
              ),
              ChatBubble(
                isMe: true,
                text: "What do you like to do for fun?",
              ),
              ChatBubble(
                isMe: false,
                text: "What do you like to do for fun?",
                showAvatar: true,
              ),
              ChatBubble(
                isMe: true,
                text: "Hi Shreya, I'm doing well. Thanks for asking!",
              ),
            ],
          ),
        ),

            // Bottom Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8FDFF),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/smile_emoji.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666)
                            ),
                            decoration: InputDecoration(
                              hintText: "Message",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF989898)
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/camera.svg'),
                        SizedBox(width: 12,),
                        SvgPicture.asset('assets/icons/file.svg')

                      ],
                    ),
                  )),
                  SizedBox(width: 12,),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/send.svg'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String text;
  final bool showAvatar;

  const ChatBubble({
    super.key,
    required this.isMe,
    required this.text,
    this.showAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      // Sender message (Right side, No avatar)
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14,
            fontWeight: FontWeight.w400),
          ),
        ),
      );
    } else {
      // Receiver message (Left side, With avatar optionally)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar)
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/image/dummay2.jpg'),
                fit: BoxFit.cover)
              ),
            )
          else
            const SizedBox(width: 32), // placeholder for alignment

          const SizedBox(width: 8),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                text,
                style:  TextStyle(color: AppColors.textColor, fontSize: 14,
                fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      );
    }
  }
}
