import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../screens/home/widgets/schedule_item_widget.dart';
import '../../database_service.dart';

class StreamAppointmentManager {
  final User? userData;
  late final StreamSubscription _streamSubscription;
  final _controller = StreamController<List<ScheduleItemWidget>>();
  Stream<List<ScheduleItemWidget>> get appointmentStream => _controller.stream;

  StreamAppointmentManager({required this.userData}) {
    _startStream();
  }

  void _startStream() {
    final dbService = DatabaseService(userData);
    _streamSubscription = dbService.userSchedule.listen((data) {
      final items = _formatScheduleData(data);
      _controller.add(items);
    });
  }

  List<ScheduleItemWidget> _formatScheduleData(Map<String, dynamic> scheduleData) {
    return scheduleData.entries.map((entry) {
      final random = Random();
      // Assuming entry.value is a Map that contains date, time, doctorName, and address
      return ScheduleItemWidget(
        date: entry.value['date'] ?? '',
        time: entry.value['time'] ?? '',
        doctorName: entry.value['doctorName'] ?? '',
        address: entry.value['address'] ?? '',
        color: Colors.primaries[random.nextInt(Colors.primaries.length)][100]!,
      );
    }).toList();
  }

  void dispose() {
    _streamSubscription.cancel();
    _controller.close();
  }
}
