// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../data/Steps.dart';
import 'package:pedometer/pedometer.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DailySteps extends StatefulWidget {
  const DailySteps({Key? key}) : super(key: key);

  @override
  State<DailySteps> createState() => _DailyStepsState();
}

class _DailyStepsState extends State<DailySteps> {
  int steps = 0;
  int stepsTotal = 10000;
  String message = 'Daily step goal';

  String getFormatedSteps(int steps) {
    if (steps < 1000) {
      return steps.toString();
    } else {
      return ('${NumberFormat("###.#", "en_US").format(steps / 1000)}k');
    }
  }

  List<charts.Series<Steps, int>> _createSampleData() {
    final data = [
      Steps(steps, charts.MaterialPalette.blue.shadeDefault), //Actual Steps
      Steps(stepsTotal - steps, charts.MaterialPalette.white), //Missing Steps
    ];

    return [
      charts.Series<Steps, int>(
        id: 'Steps',
        domainFn: (Steps steps, _) => steps.percentual,
        measureFn: (Steps steps, _) => steps.percentual,
        colorFn: (Steps steps, _) => steps.color,
        data: data,
      )
    ];
  }

  late Stream<StepCount> _stepCountStream;

  void onStepCount(StepCount event) {
    setState(() {
      steps = event.steps;
    });
  }

  void onStepCountError(error) {
    setState(() {
      message = error.toString();
    });
  }

  Future<void> initPlatformState() async {
    _stepCountStream = await Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    ;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
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
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        message,
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
                            padding: const EdgeInsets.all(5),
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
              child: Row(children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: charts.PieChart<int>(_createSampleData(),
                      animate: false,
                      layoutConfig: charts.LayoutConfig(
                        leftMarginSpec: charts.MarginSpec.fixedPixel(12),
                        topMarginSpec: charts.MarginSpec.fixedPixel(12),
                        rightMarginSpec: charts.MarginSpec.fixedPixel(12),
                        bottomMarginSpec: charts.MarginSpec.fixedPixel(12),
                      ),
                      defaultRenderer: charts.ArcRendererConfig(arcWidth: 4)),
                ),
                SizedBox(
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
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            getFormatedSteps(steps),
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
                            '/' + getFormatedSteps(stepsTotal),
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
              ])),
        ]),
      ),
    );
  }
}
