import 'package:flutter/material.dart';
import 'package:flutter_application_fine/core/apis.dart';
import 'package:flutter_application_fine/core/response_model.dart';
import 'package:flutter_application_fine/shared/components/search_list/search_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../shared/components/search_box/search_box.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<Photo>>([]);
    final searchField = useState('');
    final isLoading = useState(false);

    useEffect(() {
      isLoading.value = true;
      try {
        getItems(searchField.value).then((value) {
          items.value = value.photos?.photo ?? [];
          isLoading.value = false;
        });
      } catch (e) {
        print('error is catched $e');
        isLoading.value = false;
        items.value = [];
      }
      return null;
    }, [searchField.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Search Bar Tutorial'),
      ),
      body: Column(
        children: [
          SearchBox(searchField: searchField),
          Expanded(
            child: Center(
              child: SearchList(items: items.value, isLoading: isLoading.value),
            ),
          ),
        ],
      ),
    );
  }
}
