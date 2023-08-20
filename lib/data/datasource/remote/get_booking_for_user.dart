import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constant/host.dart';

Future<dynamic> getBookings() async {
  http.Response response = await http.get(Uri.parse(Host.getBookings));
  print(Host.getBookings);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  } 
}
