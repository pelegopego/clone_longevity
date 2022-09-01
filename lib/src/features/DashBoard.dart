// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'itemDetail.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: const Text('Test'),
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                ItemDetailsView.routeName,
              );
            });
      },
    );
  }
}
