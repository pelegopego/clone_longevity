// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../data/SummaryItem.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  static List<SummaryItem> _createSampleData() {
    return [
      SummaryItem('Risk level', 'Middle', Colors.yellow[700]),
      SummaryItem('BMI', '18.8', Colors.red[400]),
      SummaryItem('Ideal Weight', '83.2', Colors.greenAccent[400]),
      SummaryItem('Obesity Rate', 'Normal', Colors.yellow[700]),
      SummaryItem('BMR', '2290', Colors.yellow[700]),
      SummaryItem('Bio-Age', '25', Colors.black87),
      SummaryItem('Body type', 'Mesomorph', Colors.black87),
      SummaryItem('Subcutaneous Fat', '15%', Colors.yellow[700]),
    ];
  }

  List<SummaryItem> summaryList = _createSampleData();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding:
              const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
          child: Row(children: [
            const Expanded(
              child: Text(
                'My summary',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                    fontSize: 22),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.view_quilt_outlined,
                      color: Colors.blue[400],
                      size: 20,
                    )),
                const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.list_rounded,
                      color: Colors.black87,
                      size: 20,
                    )),
                const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.lens_blur_sharp,
                      color: Colors.black87,
                      size: 20,
                    )),
              ]),
            ),
          ])),
      Wrap(
        children: summaryList
            .map((e) => Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          textWidthBasis: TextWidthBasis.parent,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            color: Colors.black87,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              e.description,
                              textWidthBasis: TextWidthBasis.parent,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Comfortaa',
                                  color: e.color),
                            ))
                      ]),
                ))
            .toList(),
      ),
    ]);
  }
}
