import 'package:brightness/controller/text_controller.dart';
import 'package:brightness/core/constant/app_colors.dart';
import 'package:brightness/core/constant/app_images.dart';
import 'package:brightness/views/shared/custom_textfield.dart';
import 'package:brightness/views/widgets/get_started/custom_button.dart';
import 'package:brightness/views/widgets/search_page/photographer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/remote/get_photographers.dart';
import '../../../data/models/photographer_card_model.dart';
import '../../shared/backgroung_image.dart';

class Search extends StatelessWidget {
  Search({super.key});

  TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.bookBackground,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: CustomTextField(
                            controller: textController.search,
                            hintText: 'Name',
                            keyboardType: TextInputType.name)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: const Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: getPhotographers(),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                              itemCount: snapshot.data['data'].length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: PhotographerCard(
                                    photographerCardModel:
                                        PhotographerCardModel(
                                      image: snapshot.data['data'][index]
                                          ['image'],
                                      name: snapshot.data['data'][index]['name']
                                          .toString(),
                                      place: snapshot.data['data'][index]
                                              ['adress']
                                          .toString(),
                                      rate: snapshot.data['data'][index]['rate']
                                          .toString(),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                      }))
            ],
          )
        ],
      ),
    );
  }
}
