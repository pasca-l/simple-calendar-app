import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:calendar_widget/calendar_provider.dart';
import 'package:calendar_widget/calendar_logic.dart';


class MonthCalendar extends StatefulWidget {
  MonthCalendar({
    Key? key,
    this.offset = DateTime.monday,
    this.minYear = 2010,
  }) : super(key: key);

  final int offset;
  final int minYear;

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late int _currentPage;
  late List<String> weekDays;

  @override
  void initState() {
    super.initState();
    weekDays = CalendarGenerator().buildWeekDays(widget.offset);
    _currentPage = (DateTime.now().year - widget.minYear) * 12 
                   + DateTime.now().month;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.yMMMM().format(DateTime(widget.minYear, _currentPage, 1))
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weekDays.map((weekday) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(weekday)
                )
              );
            }).toList(),
          ),
    
          Expanded(
            child: Container(
              color: Colors.orange,
              child: PageView.builder(
                controller: PageController(initialPage: _currentPage),
                onPageChanged: (index) {setState(() {
                  _currentPage = index;
                });},
                itemBuilder: (context, index) {
                  return MonthCalendarGrid(
                    date: DateTime(widget.minYear, index, 1),
                    offset: widget.offset,
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
    
        ],
      ),
    );
  }
}


class MonthCalendarGrid extends StatefulWidget {
  const MonthCalendarGrid({
    Key? key,
    required this.date,
    this.offset = DateTime.monday,
  }) : super(key: key);

  final DateTime date;
  final int offset;

  @override
  State<MonthCalendarGrid> createState() => _MonthCalendarGridState();
}

class _MonthCalendarGridState extends State<MonthCalendarGrid> {
  late List<List<DateTime?>> calendar;

  @override
  void initState() {
    super.initState();
    calendar = CalendarGenerator().buildMonthly(widget.date, widget.offset);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calendar.map((week) {
        return Expanded(
          child: Row(
            children: week.map((date) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (date != null) {
                      context.read<CalendarProvider>().updateFocusedDate(date);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(border: Border.all()),
                    child: date == null ? Text("") : Text(date.day.toString()),
                  )
                )
              );
            }).toList()
          ),
        );
      }).toList(),
    );
  }
}