import 'package:app_clone_longevity/src/features/DashBoard.dart';
import 'package:flutter/material.dart';
import 'features/DashBoard.dart';
import 'features/appBar.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: const CustomAppBar(),
          body: const ItemListView(),
        ));
  }
}
