import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../modules/event.dart';

class CalendarBlueprint extends StatefulWidget {
  const CalendarBlueprint({super.key});

  @override
  State<CalendarBlueprint> createState() => _CalendarBlueprintState();
}

class _CalendarBlueprintState extends State<CalendarBlueprint> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    _descriptionController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              if (kDebugMode) {
                print(focusedDay);
              }
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue[100],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.blue[200],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
                  (Event event) =>
                  ListTile(
                    title: Text(event.title),
                    subtitle: Text(event.description),
                    trailing: Row(
                      children: [
                        Text("From: ${event.startTime} - ${event.endTime}"),
                      ],
                    ),
                  )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Event"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _eventController,
                      decoration: const InputDecoration(
                          hintText: "Enter event title"),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                          hintText: "Enter event description"),
                    ),
                    TextFormField(
                      controller: _startTimeController,
                      decoration: const InputDecoration(
                          hintText: "Enter start time"),
                    ),
                    TextFormField(
                      controller: _endTimeController,
                      decoration: const InputDecoration(
                          hintText: "Enter end time"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              _startTimeController.text =
                              '${time.hour}:${time.minute}';
                            }
                          },
                          child: const Text('Select Start Time'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              _endTimeController.text =
                              '${time.hour}:${time.minute}';
                            }
                          },
                          child: const Text('Select End Time'),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      final title = _eventController.text;
                      final description = _descriptionController.text;
                      final startTime = _startTimeController.text;
                      final endTime = _endTimeController.text;
                      if (title.isNotEmpty) {
                        final event = Event(title: title,
                            description: description,
                            startTime: startTime,
                            endTime: endTime);
                        if (selectedEvents[selectedDay] != null) {
                          selectedEvents[selectedDay]?.add(event);
                        } else {
                          selectedEvents[selectedDay] = [event];
                        }
                        Navigator.pop(context);
                        _eventController.clear();
                        _descriptionController.clear();
                        _startTimeController.clear();
                        _endTimeController.clear();
                        setState(() {});
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        label: const Text("Add Event"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}