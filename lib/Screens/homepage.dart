import 'package:cheli_mobile/page/addperiod.dart';
import 'package:cheli_mobile/page/analytics.dart';
import 'package:cheli_mobile/page/calendar.dart';
import 'package:cheli_mobile/page/dashboard.dart';
import 'package:cheli_mobile/page/settings.dart';
import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _selectedIndex = 0;

  static const List<Widget> page = <Widget>[
    MyDashboard(),
    MyCalendar(),
    MyAnalytics(),
    MySettings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyDashboard();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff8731DC),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPeriod()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = MyDashboard();
                            _selectedIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dashboard,
                              color: _selectedIndex == 0
                                  ? Color(0xff8731DC)
                                  : Colors.grey,
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? Color(0xff8731DC)
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = MyCalendar();
                            _selectedIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: _selectedIndex == 1
                                  ? Color(0xff8731DC)
                                  : Colors.grey,
                            ),
                            Text(
                              'Calendar',
                              style: TextStyle(
                                  color: _selectedIndex == 1
                                      ? Color(0xff8731DC)
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = MyAnalytics();
                            _selectedIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.trending_up,
                              color: _selectedIndex == 2
                                  ? Color(0xff8731DC)
                                  : Colors.grey,
                            ),
                            Text(
                              'Analytics',
                              style: TextStyle(
                                  color: _selectedIndex == 2
                                      ? Color(0xff8731DC)
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = MySettings();
                            _selectedIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.settings,
                              color: _selectedIndex == 3
                                  ? Color(0xff8731DC)
                                  : Colors.grey,
                            ),
                            Text(
                              'Settings',
                              style: TextStyle(
                                  color: _selectedIndex == 3
                                      ? Color(0xff8731DC)
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
