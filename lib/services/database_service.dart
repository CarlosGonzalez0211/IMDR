import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final User? userData;
  DatabaseService(this.userData);

  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Stream<Map<String, dynamic>> get userSchedule {
    return _dbRef.child('users/${userData?.uid}/schedule').onValue.map((event) {
      final scheduleData = event.snapshot.value as Map<dynamic, dynamic>?;
      // Convert dynamic map to a strongly typed map
      return scheduleData?.map<String, dynamic>((key, value) => MapEntry(key as String, value as dynamic)) ?? {};
    });
  }

  Future<void> initializeDummyData() async {
    final dummyData = [
      {
        'date': '2023-06-01',
        'time': '10:00 AM',
        'doctorName': 'Dr. John Doe',
        'address': '123 Main St, City',
        'color': 'blue',
      },
      {
        'date': '2023-06-03',
        'time': '2:30 PM',
        'doctorName': 'Dr. Jane Smith',
        'address': '456 Elm St, Town',
        'color': 'green',
      },
      {
        'date': '2023-06-05',
        'time': '9:00 AM',
        'doctorName': 'Dr. Michael Johnson',
        'address': '789 Oak Ave, Village',
        'color': 'orange',
      },
      {
        'date': '2023-06-05',
        'time': '10:00 AM',
        'doctorName': 'Dr. John Doe',
        'address': '789 Oak Ave, Village',
        'color': 'blue',
      },
    ];

    final userScheduleRef = _dbRef.child('users/${userData?.uid}/schedule');

    for (final item in dummyData) {
      final newItemRef = userScheduleRef.push();
      await newItemRef.set(item);
    }
  }
}
