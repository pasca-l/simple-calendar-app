import 'package:flutter/material.dart';


class DayCalendar extends StatefulWidget {
  const DayCalendar({Key? key}) : super(key: key);

  @override
  State<DayCalendar> createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Text(index.toString());
        },
      ),
    );
  }
}