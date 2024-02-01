import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchList extends HookWidget {
  final List<dynamic> items;
  final bool isLoading;

  const SearchList({super.key, required this.items, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Text('loading...')
          : items.isEmpty
              ? const Text('no data')
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    dynamic item = items[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.amber,
                        title: Text(items[index]['title'].toString(),
                            style: const TextStyle(fontFamily: 'IndieFlower')),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://farm${item['farm']}.staticflickr.com/${item['server']}/${item['id']}_${item['secret']}_s.jpg'),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
