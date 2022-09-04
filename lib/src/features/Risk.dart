// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'cards/Subscribe.dart';

class ItemItem {
  final String title;
  final String description;
  final String suggestion;
  final Color? color;

  ItemItem(this.title, this.description, this.suggestion, this.color);
}

class Risk extends StatefulWidget {
  const Risk({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RiskState createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  static List<ItemItem> _createSampleData() {
    return [
      ItemItem('Risk level is normal', '50%', '', Colors.blue[400]),
      ItemItem('BMI (Bio Mass Index)', '18.8', '', Colors.red[400]),
      ItemItem('Wheight Excess', 'Overweight', '', Colors.red[400]),
      ItemItem('Ideal Weight', '60.2', '-20.1kg remaining to match!',
          Colors.greenAccent[400]),
      ItemItem(
          'Probability of being affected by severe diseases in next 10 years',
          '60%',
          '',
          Colors.yellow[400]),
      ItemItem(
          'Chances of being affected by immunity related diseases in next 2 years',
          '20%',
          '',
          Colors.greenAccent[400]),
      ItemItem(
          'Your cancer risks are the same like other people with normal weight',
          '',
          '',
          Colors.greenAccent[400]),
      ItemItem('Your lung capacity is normal', '', '', Colors.greenAccent[400]),
    ];
  }

  List<ItemItem> ItemList = _createSampleData();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: Text(
              'Biomarker Analysis & Risks',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa',
                  fontSize: 22),
            ),
          ),
        ],
      ),
      Container(
          height: 400,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: ItemList.length,
              padding: EdgeInsets.only(left: 15, right: 15),
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            softWrap: false,
                            overflow: TextOverflow.ellipsis, // new
                            ItemList[index].title,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              fontFamily: 'Comfortaa',
                            ),
                          )),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Row(children: [
                                ItemList[index].description != ''
                                    ? Text(
                                        ItemList[index].description,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: ItemList[index].color,
                                          fontFamily: 'Comfortaa',
                                        ),
                                      )
                                    : Container(),
                              ]))
                        ],
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        ItemList[index].suggestion != ''
                            ? Text(
                                ItemList[index].suggestion,
                                style: TextStyle(
                                  fontSize: 10,
                                  height: 2.5,
                                  color: Colors.grey[700],
                                  fontFamily: 'Comfortaa',
                                ),
                              )
                            : Container(),
                      ])),
                  Container(
                      child: Divider(
                    thickness: 0.3,
                    color: Colors.blue,
                  )),
                ]);
              })),
      Subscribe(),
    ]);
  }
}
