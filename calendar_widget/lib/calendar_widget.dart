library calendar_widget;

import 'package:flutter/material.dart';
import 'package:calendar_widget/month_calendar.dart';
import 'package:calendar_widget/day_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: CalendarPage())
      ,
    );
  }
}


class CalendarAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CalendarAppBar({Key? key})
  : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Calendar"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _focusDay;
  bool _viewDay = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        MonthCalendar(),

        Visibility(
          visible: _viewDay,
          child: DayCalendar(),
        ),
    
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
    
              TextButton(
                onPressed: () {
                  setState(() {
                    _focusDay = DateTime.now();
                  });
                },
                child: Text("Today"),
              ),
    
              TextButton(
                onPressed: () {},
                child: Text("Calender"),
              ),
    
              TextButton(
                onPressed: () {
                  setState(() {
                    _viewDay = !_viewDay;
                  });
                },
                child: Text("Other"),
              ),
    
            ],
          ),
        ),

      ],
    );
  }
}