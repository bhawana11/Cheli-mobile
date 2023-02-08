import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import '../utils/colors_utils.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyCalenderState();
  }
}

class _MyCalenderState extends State<MyCalendar> {
  EventList<Event> _markedDatesMap = EventList<Event>(
    events: {},
  );

  Widget _bleeding(String day) => Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(1200))),
//    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: Center(
          child: Text(
            day,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    DateTime _currentDate;

    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Calendar",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.calendar_today),
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
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0.1, 0, 0),
            child: CalendarCarousel<Event>(
              onDayPressed: (DateTime date, List<Event> events) {
                this.setState(() => _currentDate = date);
                _markedDatesMap.add(
                    date,
                    Event(
                        date: date,
                        title: "Bleed",
                        icon: _bleeding(date.day.toString())));
              },
              iconColor: Color(0xff4d004d),
              headerTextStyle: TextStyle(
                  color: Color(0xff4d004d),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              height: cHeight * 0.8,
              todayButtonColor: Colors.deepPurpleAccent,
              weekendTextStyle: TextStyle(color: Colors.black),
              markedDatesMap: _markedDatesMap,
              markedDateShowIcon: true,
              markedDateIconMaxShown: 1,
              markedDateMoreShowTotal: null,
              markedDateIconBuilder: (event) {
                return event.icon;
              },
            ),
          ),
        ));
  }
}
