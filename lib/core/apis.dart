import 'package:dio/dio.dart';
import 'package:flutter_application_fine/core/endpoints.dart';
import 'package:flutter_application_fine/core/response_model.dart';

Future<ResponseModel> getItems(String searchText, Dio dio) async {
  Response response = await dio.get(baseUrl,
      queryParameters: searchEndpointQueryParams(searchText));
  return ResponseModel.fromJson(response.data);
}
