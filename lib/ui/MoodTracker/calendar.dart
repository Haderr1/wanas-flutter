import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Column(
      children: [
        TableCalendar(
          rowHeight: 43,
          focusedDay: today,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 10, 16),
          headerStyle: const HeaderStyle(
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
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Color(0xFF00966A),
              shape: BoxShape.circle,

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
      ],
    );
  }
}
