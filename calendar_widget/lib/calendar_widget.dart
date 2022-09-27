library calendar_widget;

import 'package:flutter/material.dart';
import 'package:calendar_widget/month_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return MonthCalendar();
  }
}