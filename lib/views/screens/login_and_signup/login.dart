// ignore_for_file: file_names

import 'package:brightness/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/text_controller.dart';
import '../../shared/backgroung_image.dart';
import '../../shared/custom_textfield.dart';
import '../../widgets/get_started/custom_button.dart';

class LoginView extends StatelessWidget {
  TextController _textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroungImage(
          image: AppImages.loginAndSignup,
        ),
        Column(
          children: const [
            SizedBox(
              height: 70,
            ),
            Center(
              child: Text(
                'login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontFamily: 'AguafinaScript-Regular'),
              ),
            )
          ],
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 65),
              child: Column(
                children: [
              
                  CustomTextField(
                    controller: _textController.loginEmail,
                    hintText: "Email",
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: _textController.loginPassword,
                    hintText: "Password",
                    keyboardType: TextInputType.name,
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    txt: 'Login',
                    function: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginView();
                      }));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
