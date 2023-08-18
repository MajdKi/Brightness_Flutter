import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/datasource/remote/get_posts.dart';
import '../../../data/datasource/remote/get_premium.dart';
import '../../../data/models/post_model.dart';
import '../../shared/backgroung_image.dart';
import '../../widgets/post_page/post_card.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
        children: [
          BackgroungImage(
            image: AppImages.postsBackroung,
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX:3, sigmaY: 3),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        ' Premium',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 75,
                      width: double.infinity,
                      child: Center(
                        child: FutureBuilder(
                            future: getPremium(),
                            builder:
                                (context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.done) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data['data'].length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(500)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(500),
                                            child: FadeInImage(
                                                placeholder: const AssetImage(
                                                    AppImages
                                                        .personPlaceHolder),
                                                image: NetworkImage(
                                                    snapshot.data['data'][index]
                                                        ['image'])),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                );
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        ' Posts',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: getPosts(),
                          builder: (context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              return ListView.builder(
                                itemCount: snapshot.data['data'].length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      PostCard(
                                        postModel: PostModel(
                                            title: snapshot.data['data'][index]
                                                ['title'],
                                            body: snapshot.data['data'][index]
                                                ['desc'],
                                            image: snapshot.data['data'][index]
                                                ['image'],
                                            photographerImage:
                                                snapshot.data['data'][index]
                                                    ['Photographer']['image'],
                                            photographerName:
                                                snapshot.data['data'][index]
                                                    ['Photographer']['name']),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
