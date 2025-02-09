class ReservationRequestModel {
  final String? tableId;
  final String? userId;
  final String? note;
  final int? peopleCount;
  final DateTime? arrivalTime;
  final DateTime? leavingTime;

  ReservationRequestModel({
    this.tableId,
    this.userId,
    this.note,
    this.peopleCount,
    this.arrivalTime,
    this.leavingTime,
  });

  factory ReservationRequestModel.fromJson(Map<String, dynamic> json) =>
      ReservationRequestModel(
        tableId: json["tableId"],
        userId: json["userId"],
        note: json["note"],
        peopleCount: json["peopleCount"],
        arrivalTime: json["arrivalTime"] == null
            ? null
            : DateTime.parse(json["arrivalTime"]),
        leavingTime: json["leavingTime"] == null
            ? null
            : DateTime.parse(json["leavingTime"]),
      );

  Map<String, dynamic> toJson() => {
        "tableId": tableId,
        "userId": userId,
        "note": note,
        "peopleCount": peopleCount,
        "arrivalTime": arrivalTime?.toIso8601String(),
        "leavingTime": leavingTime?.toIso8601String(),
      };
}
