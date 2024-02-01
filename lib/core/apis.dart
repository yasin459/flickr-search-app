import 'package:dio/dio.dart';
import 'package:flutter_application_fine/core/endpoints.dart';

final dio = Dio();

Future<List<dynamic>> getItems(String url) async {
  Response response = await dio.get(searchEndpoint(url));
  return response.data?['photos']?['photo'] ?? [];
}
