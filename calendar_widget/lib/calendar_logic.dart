class CalendarLogic {
  List<String> buildWeekDays(int offset) {
    final Map<int, String> weekDays = {
      1 : 'Mon',
      2 : 'Tue',
      3 : 'Wed',
      4 : 'Thu',
      5 : 'Fri',
      6 : 'Sat',
      7 : 'Sun',
    };
    final List<String> weekDayList = [];

    for (var i = 0; i < 7; i ++) {
      int index = i + offset;
      if (index <= 7) {
        weekDayList.add(weekDays[index]!);
      }
      else {
        weekDayList.add(weekDays[index - 7]!);
      }
    }

    return weekDayList;
  }

  List<List<DateTime?>> buildMonthly(DateTime date, int offset) {
    final List<List<DateTime?>> calendar = [];

    final initDayNum = DateTime(date.year, date.month, 1).weekday;
    final lastDate = DateTime(date.year, date.month + 1, 0).day;

    final headNulls = List.generate(
      (initDayNum - offset + 7) % 7,
      (index) => null
    );
    final numList = List.generate(
      lastDate,
      (index) => DateTime(date.year, date.month, index + 1)
    );
    final tailNulls = List.generate(
      7 - ((initDayNum + lastDate - 1) % 7),
      (index) => null
    );

    final List<DateTime?> dateList = [...headNulls, ...numList, ...tailNulls];

    for (var i = 0; i < dateList.length ~/ 7; i ++) {
      calendar.add(
        List.generate(7, (index) {
          return dateList[index + i * 7];
        })
      );
    }

    return calendar;
  }

  double calcPointerPosition(double slotHeight) {
    double initPos = 17.0;
    double position = 0.0;
    DateTime now = DateTime.now();

    position = slotHeight * (now.hour + now.minute / 60) + initPos;

    return position;
  }

  double calcPointerEndPadding(double slotHeight) {
    double padding = 0.0;
    double diff = 9.0;

    padding = slotHeight * 24.5 - calcPointerPosition(slotHeight) + diff;

    return padding;
  }
}