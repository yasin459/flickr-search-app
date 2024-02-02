dynamic searchEndpointQueryParams(String search) => {
      'method': 'flickr.photos.search',
      'text': search,
      'api_key': '1508443e49213ff84d566777dc211f2a',
      'format': 'json',
      'nojsoncallback': 1,
      'per_page': '25'
    };

String baseUrl = 'https://api.flickr.com/services/rest';
