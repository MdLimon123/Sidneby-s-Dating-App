import 'package:get/get.dart';
import 'package:sindeby_dating_app/views/screen/Home/home_screen.dart';
import 'package:sindeby_dating_app/views/screen/Profile/profile_screen.dart';
import 'package:sindeby_dating_app/views/screen/Splash/OnboardScreen/onboard_screen.dart';
import 'package:sindeby_dating_app/views/screen/Wallet/wallet_screen.dart';


import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String homeScreen="/home_screen";
  static String profileScreen="/profile_screen";
  static String walletScreen="/wallet_screen";
  static String onboardScreen = "/onboard_screen";

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:homeScreen, page: ()=>const HomeScreen()),
    GetPage(name:walletScreen, page: ()=>const WalletScreen()),
    GetPage(name:profileScreen, page: ()=>const ProfileScreen()),
    GetPage(name:onboardScreen, page: ()=>const OnboardScreen()),

  ];



}