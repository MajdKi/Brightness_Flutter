import 'dart:convert';
import 'package:brightness/controller/text_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/host.dart';

Future<dynamic> book(photographerId) async {
  TextController textController = Get.put(TextController());
  http.Response response = await http.post(
    Uri.parse(Host.book),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "date": textController.dateForBook.text,
      "place": textController.placeForBook.text,
      "price": 1200,
      "photographerId": photographerId,
      "userId": 1
    }),
  );

  print(jsonDecode(response.body));

  return jsonDecode(response.body);
}
