import 'package:cheli_mobile/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class MyAnalytics extends StatefulWidget {
  const MyAnalytics({Key? key}) : super(key: key);

  @override
  State<MyAnalytics> createState() => _MyAnalyticsState();
}

class _MyAnalyticsState extends State<MyAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Reports",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.trending_up),
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
      ),
    );
  }
}
