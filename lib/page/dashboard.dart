import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../utils/colors_utils.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Dashboard",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.dashboard),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("6A67CE"),
              hexStringToColor("947EC3"),
              hexStringToColor("B689C0")
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  radius: 300,
                  lineWidth: 40,
                  percent: 0.5,
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade200,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    'Ovulating',
                    style: TextStyle(fontSize: 40, color: Colors.deepPurple),
                  ),
                ),
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 40,
                  percent: 0.4,
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
