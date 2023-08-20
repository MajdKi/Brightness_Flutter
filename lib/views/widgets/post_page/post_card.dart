import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/models/post_model.dart';

class PostCard extends StatelessWidget {
  PostModel postModel;
  PostCard({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(500)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: FadeInImage(
                        placeholder:
                            const AssetImage(AppImages.personPlaceHolder),
                        image: NetworkImage(postModel.photographerImage)),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 6,
                  child: Text(
                    postModel.photographerName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              postModel.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              postModel.body,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Image.network(
            postModel.image,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
