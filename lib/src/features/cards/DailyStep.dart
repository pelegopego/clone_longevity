// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class DailySteps extends StatefulWidget {
  const DailySteps({Key? key}) : super(key: key);

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(1, 75),
      new LinearSales(0, 25),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  State<DailySteps> createState() => _DailyStepsState();
}

class _DailyStepsState extends State<DailySteps> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.yellow, //Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
              child: Container(
                  color: Colors.red,
                  child: Row(children: [
                    const Expanded(
                      child: Text(
                        'Daily step goal',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(children: [
                        const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.blue,
                              size: 15,
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const Text(
                              '25',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                                color: Colors.blue,
                              ),
                            )),
                      ]),
                    ),
                  ]))),
          Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
              child: Container(
                color: Colors.green,
                child: Row(children: [
                  Container(
                    height: 70,
                    width: 70,
                    color: Colors.purple,
                    child: charts.PieChart<int>(DailySteps._createSampleData(),
                        animate: false,
                        layoutConfig: charts.LayoutConfig(
                          leftMarginSpec: charts.MarginSpec.fixedPixel(10),
                          topMarginSpec: charts.MarginSpec.fixedPixel(10),
                          rightMarginSpec: charts.MarginSpec.fixedPixel(10),
                          bottomMarginSpec: charts.MarginSpec.fixedPixel(10),
                        ),
                        defaultRenderer:
                            new charts.ArcRendererConfig(arcWidth: 5)),
                  ),
                  Container(
                    color: Colors.black,
                    height: 70,
                    child: Column(children: [
                      Container(
                          color: Colors.white,
                          width: 150,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: const Text(
                            'Almost there!',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Colors.blue,
                            ),
                          )),
                      Container(
                        height: 35,
                        width: 150,
                        color: Colors.brown,
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Row(children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '7.5k',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 24),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '/10k',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 20),
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
