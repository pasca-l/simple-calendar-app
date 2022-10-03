library calendar_widget;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_widget/calendar_provider.dart';
import 'package:calendar_widget/month_calendar.dart';
import 'package:calendar_widget/day_calendar.dart';


class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarProvider(),
      child: Scaffold(
        appBar: CalendarAppBar(),
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: CalendarPage(),
        ),
      ),
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
          onPressed: () {
            context.read<CalendarProvider>().toggleDayCalendar();
          },
          icon: Icon(Icons.view_day),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),

      ],
    );
  }
}


class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        MonthCalendar(),

        Visibility(
          visible: context.watch<CalendarProvider>().viewDay,
          child: DayCalendar(),
        ),
    
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
    
              TextButton(
                onPressed: () {
                  context.read<CalendarProvider>().updateFocusedDate(
                    DateTime.now()
                  );
                },
                child: Text("Today"),
              ),
    
              TextButton(
                onPressed: () {},
                child: Text(context.watch<CalendarProvider>().focusedDate.toString()),
              ),
    
              TextButton(
                onPressed: () {},
                child: Text("Other"),
              ),
    
            ],
          ),
        ),

      ],
    );
  }
}