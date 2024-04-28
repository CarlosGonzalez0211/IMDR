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
}
