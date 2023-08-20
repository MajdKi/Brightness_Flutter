import 'package:brightness/views/widgets/get_started/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/models/rate_photographer_model.dart';
import '../../shared/backgroung_image.dart';

class RatePhotographer extends StatefulWidget {
  RatePhotographer({super.key, required this.ratePhotographerModel});
  RatePhotographerModel ratePhotographerModel;

  @override
  State<RatePhotographer> createState() => _RatePhotographerState();
}

class _RatePhotographerState extends State<RatePhotographer> {
  int stars = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.bookings,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(
                    widget.ratePhotographerModel.image,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  widget.ratePhotographerModel.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.star,
                        color: stars < 1 ? Colors.white : Colors.amber,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          stars = 1;
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.star,
                        color: stars < 2 ? Colors.white : Colors.amber,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          stars = 2;
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.star,
                        color: stars < 3 ? Colors.white : Colors.amber,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          stars = 3;
                          print(stars);
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.star,
                        color: stars < 4 ? Colors.white : Colors.amber,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          stars = 4;
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.star,
                        color: stars < 5 ? Colors.white : Colors.amber,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          stars = 5;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomButton(txt: 'Rate', function: () {}),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
