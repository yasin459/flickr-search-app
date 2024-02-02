import 'package:flutter/material.dart';
import 'package:flutter_application_fine/core/response_model.dart';
import 'package:flutter_application_fine/shared/components/empty_widget/empty_widget.dart';
import 'package:flutter_application_fine/shared/components/loading_widget/loading_widget.dart';
import 'package:flutter_application_fine/shared/components/search_list/list_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchList extends HookWidget {
  final List<Photo> items;
  final bool isLoading;

  const SearchList({super.key, required this.items, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const LoadingWidget()
          : items.isEmpty
              ? const EmptyWidget()
              : ListView.builder(
                  key: const Key('my_list'),
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  itemExtent: 100.0,
                  itemBuilder: (context, index) =>
                      ListItem(photo: items[index], index: index),
                ),
    );
  }
}
