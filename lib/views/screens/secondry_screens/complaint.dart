import 'package:brightness/views/shared/custom_textfield.dart';
import 'package:brightness/views/widgets/get_started/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/text_controller.dart';
import '../../../core/constant/app_images.dart';
import '../../shared/backgroung_image.dart';

class Complaint extends StatelessWidget {
  Complaint({super.key});

  TextController textController = Get.put(TextController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.bookings,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    'Do you have a complaint?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'Tell Us Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomTextField(
                      controller: textController.problemTitle,
                      hintText: 'Problem Title',
                      keyboardType: TextInputType.none),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: textController.problemDescription,
                    maxLines: 120,
                    decoration: InputDecoration(
                        filled: true,
                        //   focusColor: AppColors.orange,

                        fillColor: Colors.white.withOpacity(0.6),
                        //  iconColor: AppColors.orange,
                        //  labelStyle: TextStyle(color: AppColors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: const BorderSide(
                              //   color: AppColors.orange,
                              ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Enter The Massage',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: CustomButton(txt: 'Send', function: () {}))
              ],
            ),
          )
        ],
      ),
    );
  }
}
