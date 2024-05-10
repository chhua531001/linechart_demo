import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:linechart_demo/singlepoint.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Point> points = [
    // SinglePoint(x: 0, y: 0),
    // SinglePoint(x: 1, y: 1),
    // SinglePoint(x: 2, y: 1),
    // SinglePoint(x: 3, y: 4),
    // SinglePoint(x: 4, y: 5),
    // SinglePoint(x: 5, y: 2),
    const Point(0,0),
    const Point(1,1),
    const Point(2.3,1),
    const Point(3,4),
    const Point(4,5),
    const Point(5,2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart Demo'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 2.0,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  show: true,
                  spots: points
                      //解決 The argument type 'num' can't be assigned to the parameter type 'double'
                      .map((point) => FlSpot(point.x.toDouble(), point.y.toDouble()))
                      .toList(),
                  color: Colors.red,
                  isCurved: true,
                  preventCurveOverShooting: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
