import 'package:get/get.dart';
import 'package:sindeby_dating_app/views/screen/Auth/login_screen.dart';
import 'package:sindeby_dating_app/views/screen/Auth/signup_screen.dart';
import 'package:sindeby_dating_app/views/screen/Chat/inbox_screen.dart';
import 'package:sindeby_dating_app/views/screen/Explore/explore_screen.dart';
import 'package:sindeby_dating_app/views/screen/Favorite/favorite_screen.dart';
import 'package:sindeby_dating_app/views/screen/Home/home_screen.dart';
import 'package:sindeby_dating_app/views/screen/Profile/profile_screen.dart';
import 'package:sindeby_dating_app/views/screen/Splash/OnboardScreen/onboard_screen.dart';


import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String homeScreen="/home_screen";
  static String profileScreen="/profile_screen";

  static String onboardScreen = "/onboard_screen";
  static String signupScreen = "/signup_screen";
  static String loginScreen = "/login_screen";
  static String exploreScreen = "/explore_screen";
  static String favoriteScreen = "/favorite_screen";
  static String inboxScreen = "/inbox_screen";


 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:homeScreen, page: ()=>const HomeScreen()),
    GetPage(name:profileScreen, page: ()=>const ProfileScreen()),
    GetPage(name:onboardScreen, page: ()=>const OnboardScreen()),
    GetPage(name:signupScreen, page: ()=>const SignupScreen()),
    GetPage(name:loginScreen, page: ()=>const LoginScreen()),
    GetPage(name:exploreScreen, page: ()=>const ExploreScreen()),
    GetPage(name:favoriteScreen, page: ()=>const FavoriteScreen()),
    GetPage(name:inboxScreen, page: ()=>const InboxScreen()),


  ];



}