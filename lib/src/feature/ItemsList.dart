// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'item.dart';
import 'itemDetail.dart';

/// Displays a list of Items.
class ItemListView extends StatelessWidget {
  const ItemListView({
    Key? key,
    this.items = const [Item(1), Item(2), Item(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarkov Items'),
      ),
      body: ListView.builder(
        restorationId: 'ItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('Item ${item.id}'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  ItemDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
