import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasource/static/get_started.dart';
import '../views/screens/login_and_signup/welcome.dart';

abstract class GetStartedController extends GetxController{
  next();
  onPageChanged(int index);
}

class GetStartedControllerImp extends GetStartedController{
   late PageController pageController;

  int currentPage = 0;
   @override
  next() {
    currentPage++;

    if (currentPage > getStartedModel.length - 1) {
       Get.offAll(const WelcomeView()) ; 
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
 @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}