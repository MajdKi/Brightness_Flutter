import 'package:brightness/controller/Get_started_controller.dart';
import 'package:brightness/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/get_started.dart';
import '../../widgets/get_started/custom_button.dart';

class GetStarted extends GetView<GetStartedControllerImp> {
  GetStartedControllerImp getStartedControllerImp =
      Get.put(GetStartedControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          controller: getStartedControllerImp.pageController,
          onPageChanged: (val) {
            controller.onPageChanged(val);
          },
          itemCount: getStartedModel.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        getStartedModel[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: 'EduSABeginner-VariableFont_wght'),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(getStartedModel[index].image),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      getStartedModel[index].desc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                          child: CustomButton(
                        txt: AppStrings.next,
                        function:  getStartedControllerImp.next(),
                      ))),
                )
              ],
            );
          }),
    );
  }
}
