import 'package:brightness/core/constant/app_images.dart';
import 'package:brightness/core/constant/app_strings.dart';
import 'package:brightness/views/screens/login_and_signup/Login.dart';
import 'package:brightness/views/widgets/get_started/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/backgroung_image.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroungImage(image: AppImages.welcome),
        Column(
          children: const [
            SizedBox(
              height: 160,
            ),
            Center(
              child: Text(
                AppStrings.brightness,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'AguafinaScript-Regular',
                    fontSize: 60),
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
                    height: 20,
                  ),
                  CustomButton(
                    txt: 'Sign up',
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
