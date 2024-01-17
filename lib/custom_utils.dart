import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomUtils {
  static CalendarBuilders customStyle() {
    return CalendarBuilders(
      selectedBuilder: (context, date, _) {
        return Container(
          //Calendar date block shape, color, etc properties set here
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color.fromARGB(255, 2, 139, 59),
              width: 3.5,
            ),//Border.all
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),//BorderRadius.all
          ), //BoxDecoration
          child: Text(
            //Calendar date block numbers property set here
            '${date.day}',
            style: const TextStyle(color: Colors.white),
          ), //Text
        ); //Container
      },
    ); //CalendarBuilders
  }
}
