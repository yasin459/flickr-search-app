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
      child: Material(
        elevation: 2,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(100),
        child: TextField(
          style: const TextStyle(
              color: Colors.black,
              height: 2,
              fontFamily: 'IndieFlower',
              fontWeight: FontWeight.bold),
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your query',
            filled: true,
            fillColor: Colors.blueGrey.shade50,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100)),
            prefixIcon: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // color: Colors.grey.shade400),
                    child: const Icon(Icons.search, color: Colors.black))),
          ),
        ),
      ),
    );
  }
}
