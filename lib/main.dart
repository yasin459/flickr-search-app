import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_fine/pages/search_screen.dart';

void main() {
  final Dio dio = Dio();
  runApp(MaterialApp(
    routes: {
      '/': (context) => SearchScreen(
            dio: dio,
          )
    },
  ));
}
