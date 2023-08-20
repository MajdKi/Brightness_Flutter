import 'package:flutter/material.dart';

import '../../../data/models/book_model.dart';

class BookCard extends StatelessWidget {
  BookCard({super.key, required this.bookModel});
  BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 3,
            color: Colors.white,
          )),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 3,
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
                bookModel.place,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              const Icon(
                Icons.camera_alt_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                bookModel.photographerName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              const Icon(
                Icons.date_range,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                bookModel.date,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              const Icon(
                Icons.done,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                bookModel.status,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
