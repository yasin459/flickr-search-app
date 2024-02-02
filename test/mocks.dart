import 'package:flutter_application_fine/core/response_model.dart';

ResponseModel fullResponseModel = ResponseModel(
    photos: Photos(photo: [
  Photo(
    farm: 1,
    id: 'id_1',
    secret: 'secret_1',
    owner: 'owner_1',
    server: 'server_1',
    title: 'title1',
  ),
  Photo(
    farm: 2,
    id: 'id_2',
    secret: 'secret_2',
    owner: 'owner_2',
    server: 'server_2',
    title: 'title2',
  ),
]));

ResponseModel emptyResponseModel = ResponseModel(photos: Photos(photo: []));
