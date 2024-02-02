import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_fine/core/apis.dart';
import 'package:flutter_application_fine/core/response_model.dart';
import 'package:flutter_application_fine/shared/components/search_list/search_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../shared/components/search_box/search_box.dart';

class SearchScreen extends HookWidget {
  final Dio dio;

  const SearchScreen({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<Photo>>([]);
    final searchField = useState('');
    final isLoading = useState(false);

    useEffect(() {
      isLoading.value = true;
      try {
        getItems(searchField.value, dio).then((value) {
          items.value = value.photos?.photo ?? [];
          isLoading.value = false;
        });
      } catch (e) {
        isLoading.value = false;
        items.value = [];
      }
      return null;
    }, [searchField.value]);

    EdgeInsetsGeometry padding = MediaQuery.of(context).size.width > 500
        ? EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.1,
            horizontal: MediaQuery.of(context).size.width * 0.3)
        : const EdgeInsets.all(0);

    return Padding(
      padding: padding,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text(
            'Communere Search App',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SearchBox(searchField: searchField),
            Expanded(
              child: Center(
                child:
                    SearchList(items: items.value, isLoading: isLoading.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
