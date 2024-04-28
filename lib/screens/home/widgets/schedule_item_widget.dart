import 'package:flutter/material.dart';

class ScheduleItemWidget extends StatelessWidget {
  final String date;
  final String time;
  final String doctorName;
  final String address;
  final Color color; // Add color to customize the background of each card

  const ScheduleItemWidget({
    super.key,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.address,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Adjust width as needed
      margin: const EdgeInsets.all(8), // Spacing around the card
      padding: const EdgeInsets.all(10), // Spacing inside the card
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              time,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(), // Use Spacer to push the rest to the bottom
            Flexible(
              child: Text.rich(
                TextSpan(
                  text: doctorName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text.rich(
                TextSpan(text: address),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}