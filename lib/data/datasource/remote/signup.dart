import 'dart:convert';
import 'package:brightness/controller/text_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/constant/host.dart';

Future<dynamic> signup() async {
  TextController textController = Get.put(TextController());
  http.Response response = await http.post(
    Uri.parse(Host.signup),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': textController.signupName.text,
      'password': textController.signupPassword.text,
      'email': textController.signupEmail.text,
      'phoneNumber': textController.signupNumber.text,
      'points': 1000,
      'address': textController.signupAddress.text,
      'birthday': textController.signupBirthday.text
    }),
  );

  return jsonDecode(response.body);
}
