import 'dart:convert';
import 'package:brightness/controller/text_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/host.dart';

Future<dynamic> login() async {
  TextController textController = Get.put(TextController());
  http.Response response = await http.post(
    Uri.parse(Host.login),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': textController.loginEmail.text,
      'password': textController.loginPassword.text,
    }),
  );

  print(jsonDecode(response.body));

  return jsonDecode(response.body);
}
