import 'package:brightness/views/widgets/get_started/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/text_controller.dart';
import '../../../core/constant/app_images.dart';
import '../../shared/backgroung_image.dart';
import '../../shared/custom_textfield.dart';

class Update extends StatelessWidget {
  Update({super.key, required this.status});
  String status;

  TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.userProfile,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: Text(
                    'Update ' + status,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: CustomTextField(
                      obscureText: false,
                        controller: textController.updateInProfile,
                        keyboardType: TextInputType.name,
                        hintText: 'New ' + status),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomButton(txt: 'Update', function: () {})),
                      const SizedBox(
                    height: 40,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
