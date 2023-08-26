import 'package:brightness/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import '../../../data/models/photographer_card_model.dart';

class PhotographerCard extends StatelessWidget {
  PhotographerCard({super.key, required this.photographerCardModel});

  PhotographerCardModel photographerCardModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.white,
        width: 3,
      )),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(500)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: FadeInImage(
                        placeholder:
                            const AssetImage(AppImages.personPlaceHolder),
                        image: NetworkImage(photographerCardModel.image)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  photographerCardModel.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
             Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                photographerCardModel.place,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
              height: 5,
            ),
             Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                photographerCardModel.rate,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
