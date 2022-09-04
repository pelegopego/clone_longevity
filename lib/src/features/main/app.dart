import 'package:flutter/material.dart';
import '../screens/DashBoard.dart';
import '../components/appBar.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: const CustomAppBar(),
          body: const ItemListView(),
        ));
  }
}
