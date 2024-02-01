import 'package:dio/dio.dart';
import 'package:flutter_application_fine/core/endpoints.dart';
import 'package:flutter_application_fine/core/response_model.dart';

final dio = Dio();

Future<ResponseModel> getItems(String url) async {
  Response response = await dio.get(searchEndpoint(url));
  return ResponseModel.fromJson(response.data);
}
