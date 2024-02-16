import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget {
  const calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  @override
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
  // DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Column(
      children: [
        // Text('selested' + today.toString().split(" ")[0]),
        Container(
          child: TableCalendar(
            rowHeight: 43,
            focusedDay: today,
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 10, 16),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                color: Color(0xFF66C0A6),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              leftChevronIcon:
                  Icon(Icons.chevron_left, color: Color(0xFF66C0A6)),
              rightChevronIcon:
                  Icon(Icons.chevron_right, color: Color(0xFF66C0A6)),
            ),
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: _onDaySelected,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Color(0xFF00966A), // Set the color for the selected day
                shape: BoxShape.circle,
                /*image: DecorationImage(
                  image: AssetImage('assets/images/happyemj.png'),
                  fit: BoxFit.cover,
                ), */
              ),
              todayTextStyle: TextStyle(
                color: Colors.black,
              ),
              todayDecoration: BoxDecoration(
                color: Color(0x4F00966A),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
