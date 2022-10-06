class EventData {
  const EventData({
    required this.uid,
    required this.startTime,
    required this.endTime,
    required this.eventName,
    required this.eventDetail,
  });

  final String uid;
  final DateTime startTime;
  final DateTime endTime;
  final String eventName;
  final String eventDetail;
}


// class EventDatabase {
//   static Stream<QuerySnapshot> getEvents(DateTime date) {
//     final db = FirebaseFirestore.instance;
//   }
// }