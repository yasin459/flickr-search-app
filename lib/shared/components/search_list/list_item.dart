import 'package:flutter/material.dart';
import 'package:flutter_application_fine/core/response_model.dart';
import 'package:flutter_application_fine/shared/components/search_list/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListItem extends HookWidget {
  final Photo photo;

  const ListItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20); // Image border
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: Material(
        color: Colors.grey.shade100,
        elevation: 1,
        shadowColor: Colors.black,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
                padding: const EdgeInsets.all(8), // Border width
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: borderRadius),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image: makeURL(photo),
                    fit: BoxFit.cover,
                    height: 60.0,
                    width: 60.0,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      photo.title.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoCondensed'),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.perm_identity,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          photo.owner.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
