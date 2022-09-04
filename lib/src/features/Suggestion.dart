// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'cards/Subscribe.dart';

class SummaryItem {
  final String title;
  final String description;
  final Color? color;
  final IconData? icon;

  SummaryItem(this.title, this.description, this.color, this.icon);
}

class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  static List<SummaryItem> _createSampleData() {
    return [
      SummaryItem('Walk more than 8k steps per day', '', Colors.red[400],
          Icons.keyboard_double_arrow_up_rounded),
      SummaryItem(
          'Lower your cholesterol',
          'Cholesterol level should be less than 5 \nCurrent: 5,7 mmol/L',
          Colors.red[400],
          Icons.keyboard_arrow_up_rounded),
      SummaryItem('Limit Alcohol consumption to 1-2 glasses a day', '',
          Colors.yellow[700], Icons.rectangle),
      SummaryItem('Limit Alcohol consumption to 1-2 glasses a day', '',
          Colors.greenAccent[400], Icons.circle),
    ];
  }

  List<SummaryItem> summaryList = _createSampleData();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: const Text(
              'Suggestions',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa',
                  fontSize: 22),
            ),
          ),
        ],
      ),
      SizedBox(
          height: 280,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: summaryList.length,
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            summaryList[index].icon,
                            color: summaryList[index].color,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, // new
                            summaryList[index].title,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              fontFamily: 'Comfortaa',
                            ),
                          )),
                        ],
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        summaryList[index].description != ''
                            ? Text(
                                summaryList[index].description,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 2.5,
                                  color: Colors.grey[700],
                                  fontFamily: 'Comfortaa',
                                ),
                              )
                            : Container(),
                      ])),
                  const Divider(
                    thickness: 0.3,
                    color: Colors.blue,
                  ),
                ]);
              })),
      const Subscribe(),
    ]);
  }
}
