// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'item.dart';
import 'itemDetail.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({
    Key? key,
    this.items = const [Item(1), Item(2), Item(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<Item> items;
  final String _query = """
    query {
      itemsByName(name: "colt") {
        name
        types
        avg24hPrice
        basePrice
        width
        height
        changeLast48hPercent
        iconLink
        link
        sellFor {
          price
          source
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarkov Items'),
        ),
        body: Query(
            options: QueryOptions(
              document: gql(_query),
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Text('Loadings');
              }
              List? items = result.data?['itemsByName'];

              if (items == null) {
                return const Text('No items found');
              }

              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return ListTile(
                      title: Text(item['name']),
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(item['iconLink']),
                        foregroundColor: Colors.white,
                      ),
                      onTap: () {
                        Navigator.restorablePushNamed(
                          context,
                          ItemDetailsView.routeName,
                        );
                      });
                },
              );
            }));
  }
}
