// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:star_liga/core/constant/app_colors.dart';
// import 'package:star_liga/core/constant/app_images.dart';
// import 'package:star_liga/view/screens/main_page.dart';

// import '../../../core/constant/app_colors.dart';
// import '../../../core/constant/app_images.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSplashScreen(
//           duration: 3000,
//           splashIconSize: 200,
//           splash: Center(child: Image.asset(AppImages.appLogo)),
//           nextScreen: const MainPage(),
//           backgroundColor:  AppColors.mainColor),
//     );
//   }
// }