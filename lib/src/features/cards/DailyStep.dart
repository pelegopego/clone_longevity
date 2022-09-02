// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Steps {
  final int percentual;
  final charts.Color color;

  Steps(this.percentual, this.color);
}

class DailySteps extends StatefulWidget {
  const DailySteps({Key? key}) : super(key: key);

  static List<charts.Series<Steps, int>> _createSampleData() {
    final data = [
      new Steps(75, charts.MaterialPalette.blue.shadeDefault), //Actual Steps
      new Steps(25, charts.MaterialPalette.white), //Missing Steps
    ];

    return [
      new charts.Series<Steps, int>(
        id: 'Steps',
        domainFn: (Steps steps, _) => steps.percentual,
        measureFn: (Steps steps, _) => steps.percentual,
        colorFn: (Steps steps, _) => steps.color,
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
                        'Daily step goal',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 14),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(children: [
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.blue[400],
                              size: 15,
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '25',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                                color: Colors.blue[400],
                              ),
                            )),
                      ]),
                    ),
                  ]))),
          Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
              child: Container(
                child: Row(children: [
                  Container(
                    height: 70,
                    width: 70,
                    child: charts.PieChart<int>(DailySteps._createSampleData(),
                        animate: false,
                        layoutConfig: charts.LayoutConfig(
                          leftMarginSpec: charts.MarginSpec.fixedPixel(12),
                          topMarginSpec: charts.MarginSpec.fixedPixel(12),
                          rightMarginSpec: charts.MarginSpec.fixedPixel(12),
                          bottomMarginSpec: charts.MarginSpec.fixedPixel(12),
                        ),
                        defaultRenderer:
                            new charts.ArcRendererConfig(arcWidth: 4)),
                  ),
                  Container(
                    height: 70,
                    child: Column(children: [
                      Container(
                          width: 150,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Almost there!',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Colors.blue[400],
                            ),
                          )),
                      Container(
                        height: 35,
                        width: 150,
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
