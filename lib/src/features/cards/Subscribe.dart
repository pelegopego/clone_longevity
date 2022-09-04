// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 140,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade600,
              Colors.blue.shade700,
              Colors.blue.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Container(
              height: 50,
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, right: 10, left: 10, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'More personal recommendations \nand risk reports?',
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.5,
                        fontFamily: 'Comfortaa',
                        fontSize: 13),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Subscribe & get 1 month free',
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                        fontSize: 13),
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 0),
                        child: Text(
                          "Subscribe",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              fontSize: 12),
                        ),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () => {},
                    )),
              ])),
        ),
      ),
    );
  }
}
