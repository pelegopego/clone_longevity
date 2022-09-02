// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
              child: Container(
                  height: 25,
                  child: Row(children: [
                    const Expanded(
                      child: Text(
                        'My Balance',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 14),
                      ),
                    ),
                  ]))),
          Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
              child: Container(
                child: Row(children: [
                  Container(
                    height: 70,
                    child: Column(children: [
                      Container(
                        height: 58,
                        width: 150,
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Row(children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '3.',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 24),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              '578',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: 3, left: 5),
                            child: Text(
                              '\$LONG',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 14),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ]),
              )),
        ]),
      ),
    );
  }
}
