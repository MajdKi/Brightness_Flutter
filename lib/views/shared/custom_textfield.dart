import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  TextInputType keyboardType;
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          filled: true,
          //   focusColor: AppColors.orange,

          fillColor: Colors.white.withOpacity(0.6),
          //  iconColor: AppColors.orange,
          //  labelStyle: TextStyle(color: AppColors.orange),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: const BorderSide(
                //   color: AppColors.orange,
                ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: const BorderSide(
              color: AppColors.borderSide,
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderSide,
            ),
            borderRadius: BorderRadius.circular(35.r),
          )),
    );
  }
}
