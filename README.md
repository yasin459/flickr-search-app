# flutter_application_fine
## Caution: you have to add your FLICKR API_KEY to .env file or otherwise it won't work

A search flutter app by using flickr search api usign Dart 3.

![image](https://github.com/yasin459/flickr-search-app/assets/60640286/c3167374-a6ca-4268-8e4f-5c9e5d935715)
![image](https://github.com/yasin459/flickr-search-app/assets/60640286/0174f1cb-1d3d-4710-ba92-da55ba8c0d65)

## main features
- fast and performant design
- using Dio for making rest api's
- using debounced search when entering queries
- reading api_key from .env file using dotenv package
- integration tests with coverage of 98.2%
- using Flutter_test and http_mock_adapter(for Dio) testing
- mocked Dio, NetworkImage, Dotenv.
- no lint error
- custom fonts, loading widget with gifs and animations
- used best practices for folder structure
- auto Model generation of flickr api using [this api](https://javiercbk.github.io/json_to_dart/)
## test coverage
steps to make coverage report
- flutter test --coverage
- genhtml coverage/lcov.info -o coverage/html
- open coverage/html/index.html
  
test coverage result using lcov 
![image](https://github.com/yasin459/flickr-search-app/assets/60640286/8a3aed00-74b5-45e5-8d59-6eaff5021656)
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
