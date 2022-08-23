import 'package:flutter/material.dart';

import 'feature/itemsList.dart';
import 'feature/itemDetail.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Tarkov',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case ItemDetailsView.routeName:
                return const ItemDetailsView();
              case ItemListView.routeName:
              default:
                return const ItemListView();
            }
          },
        );
      },
    );
  }
}
