import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime _focusedDate = DateTime.now();

  DateTime get focusedDate => _focusedDate;

  void updateFocusedDate(DateTime newDate) {
    _focusedDate = newDate;
    notifyListeners();
  }
}