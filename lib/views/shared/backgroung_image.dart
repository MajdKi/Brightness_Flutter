import 'package:flutter/material.dart';


class BackgroungImage extends StatelessWidget {
  String image;
  BackgroungImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.asset(image,    fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,);
  }
}
