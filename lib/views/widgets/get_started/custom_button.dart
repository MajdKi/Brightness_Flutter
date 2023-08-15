import 'package:brightness/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Get_started_controller.dart';

class CustomButton extends GetView<GetStartedControllerImp> {
  String txt;
  Function() function;

  CustomButton({super.key, required this.txt, required this.function});
  GetStartedControllerImp getStartedControllerImp =
      Get.put(GetStartedControllerImp());

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ));
  }
}
