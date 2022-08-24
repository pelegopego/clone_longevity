import 'package:flutter/material.dart';

import 'src/app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  final HttpLink link = HttpLink(
    'https://api.tarkov.dev/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  runApp(MyApp(client: client));
}
