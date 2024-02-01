import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../utils/debouncer.dart';

class SearchBox extends HookWidget {
  final ValueNotifier<String> searchField;
  final _debouncer = Debouncer(milliseconds: 500);

  SearchBox({super.key, required this.searchField});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    useEffect(() {
      controller.addListener(() => _debouncer.run(() {
            searchField.value = controller.text;
          }));
      return null;
    }, [controller]);

    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
