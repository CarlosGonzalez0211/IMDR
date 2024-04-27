import 'package:flutter/material.dart';

import '../widgets/schedule_item_widget.dart';

class ScheduleList extends StatelessWidget {
  final List<ScheduleItem> items;

  const ScheduleList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0), // Add padding around the title
          child: Text(
            'Your Next Appointment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),// Styling for the title
          ),
        ),
        SizedBox(
          height: 150, // Adjust height as needed for the list
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Make it scrollable horizontally
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index];
            },
          ),
        ),
      ],
    );
  }
}
