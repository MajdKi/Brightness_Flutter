import 'package:flutter/material.dart';

import '../../../core/functions/set_main_page.dart';
import 'posts.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  Widget body = Posts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          body,
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () {
                        setState(() {
                          body = setMainPage(0);
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () {
                        setState(() {
                          body = setMainPage(1);
                        });
                      },
                    ),
                    InkWell(
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 35,
                        ),
                        onTap: () {
                          setState(() {
                            body = setMainPage(2);
                          });
                        }),
                    InkWell(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () {
                        setState(() {
                          body = setMainPage(3);
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.book,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () {
                        setState(() {
                          body = setMainPage(4);
                        });
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
