import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  final String tableNo;
  final int floor;
  final int capacity;
  final bool cigarette;
  final bool windowView;
  final String userName;
  final String userEmail;
  final String note;
  final int peopleCount;
  final String arrivalTime;
  final String leavingTime;

  const ReservationCard({
    super.key,
    required this.tableNo,
    required this.floor,
    required this.capacity,
    required this.cigarette,
    required this.windowView,
    required this.userName,
    required this.userEmail,
    required this.note,
    required this.peopleCount,
    required this.arrivalTime,
    required this.leavingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ExpansionTile(
        title: Text(
          "Table $tableNo (Floor: $floor)",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            "Capacity: $capacity, Window View: ${windowView ? 'Yes' : 'No'}"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User: $userName"),
                Text("Email: $userEmail"),
                Text("Cigarette Allowed: ${cigarette ? 'Yes' : 'No'}"),
                Text("Arrival: $arrivalTime"),
                Text("Leaving: $leavingTime"),
                Text("People Count: $peopleCount"),
                Text("Note: $note"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
