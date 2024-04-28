import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../../services/managers/data/stream_appointment_manager.dart';
import '../widgets/schedule_item_widget.dart';

class ScheduleList extends StatelessWidget {
  final StreamAppointmentManager _streamAppointmentManager;

  ScheduleList({super.key})
      : _streamAppointmentManager = StreamAppointmentManager(userData: FirebaseAuth.instance.currentUser);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Text(
            'Your Next Appointments',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        StreamBuilder<List<ScheduleItemWidget>>(
          stream: _streamAppointmentManager.appointmentStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // This centers the content vertically.
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipOval(
                        child: SvgPicture.asset(
                          'assets/asset_logo.svg',  // Path to your local SVG asset
                          width: 80, // Double the radius to match the desired size
                          height: 80, // Double the radius to match the desired size
                          fit: BoxFit.cover, // Ensures the SVG fills the clip area
                        ),
                      )
                    ),
                    const SizedBox(height: 10), // Space between the avatar and text.
                    const Text(
                      'You have no appointments coming up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18, // Adjust font size as needed.
                        color: Colors.black, // Text color.
                        fontWeight: FontWeight.w200
                      ),
                    ),
                  ],
                ),
              );
            }


            var items = snapshot.data!;
            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ScheduleItemWidget(
                    date: item.date,
                    time: item.time,
                    doctorName: item.doctorName,
                    address: item.address,
                    color: item.color,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
