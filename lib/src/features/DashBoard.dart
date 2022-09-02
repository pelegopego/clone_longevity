// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cards/DailyStep.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    List cardList = [
      DailySteps(),
      DailySteps(),
    ];
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 120.0,
              aspectRatio: 2.0,
              enableInfiniteScroll: false,
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: card,
                );
              });
            }).toList(),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
