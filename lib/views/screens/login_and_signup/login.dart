// ignore_for_file: file_names

import 'package:brightness/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/text_controller.dart';
import '../../../data/datasource/remote/login.dart';
import '../../shared/backgroung_image.dart';
import '../../shared/custom_textfield.dart';
import '../../widgets/get_started/custom_button.dart';
import '../main_screens/main_screens.dart';

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
                    obscureText: false,
                    controller: _textController.loginEmail,
                    hintText: "Email",
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    obscureText:  true,
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
                        return Scaffold(
                            body: FutureBuilder(
                          future: login(),
                          builder: (context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              if (snapshot.data['statusCode'] == 200) {
                                return const MainScreens();
                              } else {
                                return AlertDialog(
                                  title: const Text(
                                      'Something went wrong, please try again'),
                                  actions: [
                                    InkWell(
                                      child: Container(
                                        color: Colors.red,
                                        padding: const EdgeInsets.all(12),
                                        child: const Center(
                                          child: Text(
                                            'Back',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              }
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ));
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
