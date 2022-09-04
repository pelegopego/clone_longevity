// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
              child: SizedBox(
                  height: 25,
                  child: Row(children: const [
                    Expanded(
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
              child: Row(children: [
                SizedBox(
                  height: 70,
                  child: Column(children: [
                    Container(
                      height: 58,
                      width: 150,
                      padding: const EdgeInsets.only(top: 10, left: 10),
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
                          padding: const EdgeInsets.only(bottom: 2),
                          child: const Text(
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
                          padding: const EdgeInsets.only(bottom: 3, left: 5),
                          child: const Text(
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
              ])),
        ]),
      ),
    );
  }
}
