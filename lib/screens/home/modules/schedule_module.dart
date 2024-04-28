import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            if (!snapshot.hasData) return const Center(child: Text('You have no appointments coming up'),);

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
