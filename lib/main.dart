import 'package:flutter/material.dart';
import 'package:flutter_application_fine/pages/search_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {'/': (context) => const SearchScreen()},
  ));
}
