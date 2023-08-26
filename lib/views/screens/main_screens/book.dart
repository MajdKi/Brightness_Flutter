import 'package:brightness/controller/text_controller.dart';
import 'package:brightness/views/shared/custom_textfield.dart';
import 'package:brightness/views/widgets/get_started/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/datasource/remote/book.dart';
import '../../../data/models/book_page_model.dart';
import '../../shared/backgroung_image.dart';

class Book extends StatelessWidget {
  Book({super.key, required this.bookPageModel});

  BookPageModel bookPageModel;
  TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.bookBackground,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      bookPageModel.image,
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    bookPageModel.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
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
                          controller: textController.placeForBook,
                          hintText: 'Location',
                          keyboardType: TextInputType.name)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomTextField(
                          obscureText: false,
                          controller: textController.dateForBook,
                          hintText: 'Date',
                          keyboardType: TextInputType.name)),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: CustomButton(
                        txt: 'Book',
                        function: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Scaffold(
                              body: FutureBuilder(
                                  future: book(bookPageModel.photographerId),
                                  builder: (context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.connectionState ==
                                            ConnectionState.done) {
                                      return Scaffold(
                                        backgroundColor: Colors.black,
                                        body: Center(
                                          child: InkWell(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                              color: Colors.white,
                                              child: const Center(
                                                child: Text(
                                                  'Done',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            );
                          }));
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
