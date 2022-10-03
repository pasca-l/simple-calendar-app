import 'dart:ffi';

import 'package:calendar_widget/calendar_logic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:calendar_widget/calendar_provider.dart';


class DayCalendar extends StatefulWidget {
  const DayCalendar({Key? key}) : super(key: key);

  @override
  State<DayCalendar> createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  final double _slotHeight = 50.0;
  final ScrollController _timelineCtrl = ScrollController();
  final ScrollController _pointerCtrl = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _timelineCtrl.dispose();
    _pointerCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [

          Text(
            DateFormat.MMMd().format(
              context.watch<CalendarProvider>().focusedDate
            )
          ),

          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _timelineCtrl.jumpTo(_pointerCtrl.offset);
                return true;
              },
              child: Stack(
                children: [

                  Timeline(
                    slotHeight: _slotHeight,
                    controller: _timelineCtrl,
                  ),
            
                  CurrentTimePointer(
                    slotHeight: _slotHeight,
                    controller: _pointerCtrl,
                  ),
            
                  // Text("test"),
            
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


class Timeline extends StatelessWidget {
  const Timeline({
    super.key,
    required this.slotHeight,
    required this.controller,
  });

  final double slotHeight;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: 25,
      itemBuilder: (context, index) {
        DateTime ref = context.watch<CalendarProvider>().focusedDate;
        String timeslot = DateFormat.Hm().format(
          DateTime(ref.year, ref.month, ref.day, index, 0)
        );
        
        return SizedBox(
          height: slotHeight,
          child: Row(
            children: [
          
              Align(
                alignment: Alignment.centerLeft,
                child: Text(timeslot)
              ),
          
              Expanded(
                child: Divider(
                  color: Colors.black38,
                  indent: 5,
                  endIndent: 5,
                ),
              ),
          
            ],
          ),
        );
      },
    );
  }
}


class CurrentTimePointer extends StatelessWidget {
  const CurrentTimePointer({
    super.key,
    required this.slotHeight,
    required this.controller,
  });

  final double slotHeight;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
      
          SizedBox(
            height: CalendarLogic().calcPointerPosition(slotHeight),
          ),
      
          Row(
            children: [
            
              SizedBox(
                width: 40,
              ),
              
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
                
              Expanded(
                child: Divider(
                  color: Colors.red,
                  endIndent: 5,
                ),
              ),
                
            ],
          ),

          SizedBox(
            height: CalendarLogic().calcPointerEndPadding(slotHeight),
          )
    
        ],
      ),
    );
  }
}