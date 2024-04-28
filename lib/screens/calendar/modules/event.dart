class Event {
  final String title;
  final String description;
  final String startTime;
  final String endTime;

  Event({required this.title, this.description = '', required this.startTime, required this.endTime});

  @override
  String toString() => '$title: $description - from:$startTime - $endTime ';
}