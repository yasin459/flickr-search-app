import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_fine/core/endpoints.dart';
import 'package:flutter_application_fine/pages/search_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'mocks.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;
  group('Testing entire app', () {
    const searchText = 'search_1';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(
        dio: dio,
      );
      dioAdapter
        ..onGet(baseUrl, (request) => request.reply(200, emptyResponseModel),
            queryParameters: searchEndpointQueryParams(''))
        ..onGet(baseUrl, (request) => request.reply(200, fullResponseModel),
            queryParameters: searchEndpointQueryParams(searchText));
    });

    testWidgets('app should render on start up and show show no results text',
        (WidgetTester tester) async {
      // mocking ImageNetwork
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(MaterialApp(
          home: SearchScreen(dio: dio),
        ));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        // search box should be empty
        expect(find.text(searchText), findsNothing);
        // empty widget should be shown
        expect(find.text("Sorry! could'nt fetch any data :( "), findsOneWidget);
        // list should be empty
        final itemFinder = find.byKey(const ValueKey('item_1_text'));
        expect(itemFinder, findsNothing);
        // search icon should be present
        expect(find.byIcon(Icons.search), findsOneWidget);
      });
    });

    testWidgets('app should show results after entering search text',
        (WidgetTester tester) async {
      // mocking ImageNetwork
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(MaterialApp(
          home: SearchScreen(dio: dio),
        ));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        // enter search text and expect to be applied
        await tester.enterText(find.byType(TextField), searchText);
        expect(find.text(searchText), findsOne);
        // wait for async api calls
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // find 2 items in the list, one with key:'item_0_text' and second with key: 'item_2_text'
        final listFinder = find.byKey(const ValueKey('my_list'));
        final firstItemFinder = find.byKey(const ValueKey('item_0_text'));
        final secondItemFinder = find.byKey(const ValueKey('item_1_text'));
        final thirdItemFinder = find.byKey(const ValueKey('item_2_text'));

        // Scroll until the item to be found appears.
        await tester.dragUntilVisible(
            firstItemFinder, listFinder, Offset.infinite);
        await tester.dragUntilVisible(
            secondItemFinder, listFinder, Offset.infinite);

        // Verify that the item contains the correct text.
        expect(firstItemFinder, findsOneWidget);
        expect(secondItemFinder, findsOneWidget);
        expect(thirdItemFinder, findsNothing);
      });
    });
    test('dio response should be exactly what is passed to it', () async {
      const route = '/';

      dioAdapter.onGet(
        route,
        (request) => request.reply(200, jsonEncode(fullResponseModel)),
      );
      response = await dio.get(route);
      expect(response.statusCode, 200);
      expect(response.data, jsonEncode(fullResponseModel));
    });
  });
}
