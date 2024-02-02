import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_fine/pages/search_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final Dio dio = Dio();
  runApp(MaterialApp(
    routes: {
      '/': (context) => SearchScreen(
            dio: dio,
          )
    },
  ));
}
