// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// Displays detailed information about a Item.
class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({Key? key}) : super(key: key);

  static const routeName = '/_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
