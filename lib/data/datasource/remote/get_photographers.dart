import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constant/host.dart';

Future<dynamic> getPhotographers() async {
  http.Response response = await http.get(Uri.parse(Host.getPhotographers));
  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } 
}
