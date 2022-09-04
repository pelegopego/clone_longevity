// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../cards/Subscribe.dart';
import '../data/RiskItem.dart';

class Risk extends StatefulWidget {
  const Risk({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RiskState createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  static List<RiskItem> _createSampleData() {
    return [
      RiskItem('Risk level is normal', '50%', '', Colors.blue[400]),
      RiskItem('BMI (Bio Mass Index)', '18.8', '', Colors.red[400]),
      RiskItem('Wheight Excess', 'Overweight', '', Colors.red[400]),
      RiskItem('Ideal Weight', '60.2', '-20.1kg remaining to match!',
          Colors.greenAccent[400]),
      RiskItem(
          'Probability of being affected by severe diseases in next 10 years',
          '60%',
          '',
          Colors.yellow[400]),
      RiskItem(
          'Chances of being affected by immunity related diseases in next 2 years',
          '20%',
          '',
          Colors.greenAccent[400]),
      RiskItem(
          'Your cancer risks are the same like other people with normal weight',
          '',
          '',
          Colors.greenAccent[400]),
      RiskItem('Your lung capacity is normal', '', '', Colors.greenAccent[400]),
    ];
  }

  // ignore: non_constant_identifier_names
  List<RiskItem> RiskItemList = _createSampleData();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: const Text(
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
      SizedBox(
          height: 400,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: RiskItemList.length,
              padding: const EdgeInsets.only(left: 15, right: 15),
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
                            RiskItemList[index].title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              fontFamily: 'Comfortaa',
                            ),
                          )),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Row(children: [
                                RiskItemList[index].description != ''
                                    ? Text(
                                        RiskItemList[index].description,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: RiskItemList[index].color,
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
                        RiskItemList[index].suggestion != ''
                            ? Text(
                                RiskItemList[index].suggestion,
                                style: TextStyle(
                                  fontSize: 10,
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
