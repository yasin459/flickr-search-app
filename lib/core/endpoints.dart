import 'package:flutter_dotenv/flutter_dotenv.dart';

dynamic searchEndpointQueryParams(String search) {
  return {
    'method': 'flickr.photos.search',
    'text': search,
    'api_key': dotenv.env['KEY'],
    'format': 'json',
    'nojsoncallback': 1,
    'per_page': '25'
  };
}

String baseUrl = 'https://api.flickr.com/services/rest';
