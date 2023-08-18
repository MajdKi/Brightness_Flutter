import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constant/host.dart';

Future<dynamic> getPosts() async {
  http.Response response = await http.get(Uri.parse(Host.getPosts));
  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } 
}
