import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBlueprint extends StatefulWidget {
  const CalendarBlueprint({super.key});

  @override
  State<CalendarBlueprint> createState() => _CalendarBlueprintState();
}

class _CalendarBlueprintState extends State<CalendarBlueprint> {

  DateTime today  = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content()
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text("Selected day: ${today.toString().split(" ")[0]}"),
            TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
                const HeaderStyle(formatButtonVisible:false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 20),
              lastDay: DateTime.utc(2030, 10, 20),
              onDaySelected: _onDaySelected,
            )
          ],
        )
    );
  }
}
