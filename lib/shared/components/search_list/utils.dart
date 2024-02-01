import 'package:flutter_application_fine/core/response_model.dart';

String makeURL(Photo photo) {
  return 'https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_s.jpg';
}
