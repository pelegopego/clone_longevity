// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Summary.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../cards/DailyStep.dart';
import '../cards/Balance.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cardList = [
    const DailySteps(),
    const Balance(),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 105.0,
          enableInfiniteScroll: false,
        ),
        items: cardList.map((card) {
          return Builder(builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: card,
            );
          });
        }).toList(),
      ),
      const Summary(),
    ]);
  }
}
