import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import './custom_utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  final _firstDay = DateTime.utc(2000);
  final _lastDay = DateTime.utc(2030);
  List<DateTime> selectedDates = []; //Added for multiple clickable days
  //DateTime? _selectedDay;
  //
  //
  // CalendarBuilders _customStyle() {
  //   return CalendarBuilders(
  //     selectedBuilder: (context, date, _) {
  //       return Container(
  //         //Calendar date block shape, color, etc properties set here
  //         margin: const EdgeInsets.all(4.0),
  //         alignment: Alignment.center,
  //         decoration: BoxDecoration(
  //           color: Colors.green,
  //           shape: BoxShape.rectangle,
  //           border: Border.all(
  //             color: const Color.fromARGB(255, 2, 139, 59),
  //             width: 3.5,
  //           ),
  //           borderRadius: const BorderRadius.all(
  //             Radius.circular(8.0),
  //           ),
  //         ), //BoxDecoration
  //         child: Text(
  //           //Calendar date block numbers property set here
  //           '${date.day}',
  //           style: const TextStyle(color: Colors.white),
  //         ), //Text
  //       ); //Container
  //     },
  //   ); //CalendarBuilders
  // }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing functions'),
      ), //AppBar
      body: Container(
        padding: const EdgeInsets.only(
          top: 25.0,
          left: 3.0,
          right: 3.0,
        ), //EdgeInsets.only
        child: Column(
          children: [
            TableCalendar(
              firstDay: _firstDay,
              lastDay: _lastDay,
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerVisible: true,
              headerStyle: const HeaderStyle(
                headerMargin: EdgeInsets.all(10.0),
                headerPadding: EdgeInsets.all(3.0),
              ), //HeaderStyle
              selectedDayPredicate: (day) {
                //return !isSameDay(_selectedDay, day);
                return selectedDates.contains(day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  //SetState logic changed here format-2. In this logic we can
                  //click multiple days in multiple months. Clicking on the
                  //already clicked day will remove the clicked status of that
                  //day.
                  if (selectedDates.contains(selectedDay)) {
                    selectedDates.remove(selectedDay);
                  } else {
                    selectedDates.add(selectedDay);
                  }
                  //SetState logic original is kept here. This is format-1. If
                  //this logic is kept then only any one days in any month can
                  //be recorded. When new day is clicked, the old clicked day
                  //removes it's clicked status.
                  // _selectedDay = selectedDay;
                  // _focusedDay =
                  //     focusedDay; // update the focused day to selected day
                  // _handleDateSelection(selectedDay);
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ), //TextStyle
                todayTextStyle: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ), //TextStyle
                // selectedTextStyle: const TextStyle(
                //   color: Colors.deepOrange,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18.0,
                // ),
                todayDecoration: BoxDecoration(
                  color: Colors.lime,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 134, 145, 37),
                    width: 3.0,
                  ), //Border.all
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7.0),
                  ), //BorderRadius.all
                ), //BoxDecoration
                // selectedDecoration: BoxDecoration(
                //   color: Colors.red,
                //   shape: BoxShape.rectangle,
                //   border: Border.all(
                //     color: const Color.fromARGB(255, 134, 145, 37),
                //     width: 3.0,
                //   ),
                //   borderRadius: const BorderRadius.all(
                //     Radius.circular(7.0),
                //   ),
                // ),
              ), //_customStyle(), //defined outside build sequence
              //CalendarStyle
              calendarBuilders: CustomUtils.customStyle(),
            ), //TableCalendar
            Container(
              padding: const EdgeInsets.all(2.5),
              child: Text('$selectedDates'),
            ), //Container
          ],
        ), //Column
      ), //Container
    ); //Scaffold
  }
}
