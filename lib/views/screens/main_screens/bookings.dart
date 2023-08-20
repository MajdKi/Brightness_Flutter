import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/datasource/remote/get_booking_for_user.dart';
import '../../../data/models/book_model.dart';
import '../../shared/backgroung_image.dart';
import '../../widgets/book_page/book_card.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

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
                height: 70,
              ),
              const Center(
                child: Text(
                  'Bookings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontFamily: 'AguafinaScript-Regular'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: FutureBuilder(
                    future: getBookings(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        print(123);
                        // print(snapshot.data['data'][0]['Photographer']['name']);
                        print(123);

                        return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: BookCard(
                                        bookModel: BookModel(
                                            place: snapshot.data['data'][index]
                                                ['place'],
                                            date: snapshot.data['data'][index]
                                                ['date'],
                                            photographerName: snapshot
                                                .data['data'][index]
                                                    ['Photographer']['name']
                                                .toString(),
                                            status: snapshot.data['data'][index]
                                                ['status'])),
                                  ),
                                ],
                              );
                            });
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
          )
        ],
      ),
    );
  }
}
