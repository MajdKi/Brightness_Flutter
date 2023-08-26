import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/models/book_page_model.dart';
import '../../../data/models/photographer_page_model.dart';
import '../../shared/backgroung_image.dart';
import '../secondry_screens/complaint.dart';
import 'book.dart';

class PhotographerProfile extends StatelessWidget {
  PhotographerProfile({super.key, required this.photographerPageModel});

  PhotographerPageModel photographerPageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.photographerProfileBackground,
          ),
          const Positioned(
              top: 120,
              right: 15,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              )),
          Positioned(
              top: 60,
              right: 10,
              child: Row(
                children: [
                  Text(
                    photographerPageModel.rate,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 40,
                  )
                ],
              )),
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
                      photographerPageModel.image,
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
                    photographerPageModel.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    photographerPageModel.bio,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                     InkWell(
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.info,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return Complaint();
                        })));
                      },
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return Book(
                              bookPageModel: BookPageModel(
                                  image: photographerPageModel.image,
                                  name: photographerPageModel.name,
                                  photographerId:
                                      photographerPageModel.photographerId));
                        })));
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
