import 'package:flutter/material.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({Key? key}) : super(key: key);

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("test"),
        ),

        Expanded(
          child: PageView.builder(
            controller: PageController(initialPage: 120),
            itemBuilder: (context, index) {
              return Text("Calendar page");
            },
          ),
        ),

      ],
    );
  }
}