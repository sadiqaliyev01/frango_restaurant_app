class ReservationResponse {
  final String id;
  final TableInfo table;
  final UserInfo user;
  final String note;
  final int peopleCount;
  final String arrivalTime;
  final String leavingTime;

  ReservationResponse({
    required this.id,
    required this.table,
    required this.user,
    required this.note,
    required this.peopleCount,
    required this.arrivalTime,
    required this.leavingTime,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      id: json['id'],
      table: TableInfo.fromJson(json['table']),
      user: UserInfo.fromJson(json['user']),
      note: json['note'],
      peopleCount: json['peopleCount'],
      arrivalTime: json['arrivalTime'],
      leavingTime: json['leavingTime'],
    );
  }
}

class TableInfo {
  final String id;
  final String no;
  final int floor;
  final int capacity;
  final bool cigarette;
  final bool windowView;

  TableInfo({
    required this.id,
    required this.no,
    required this.floor,
    required this.capacity,
    required this.cigarette,
    required this.windowView,
  });

  factory TableInfo.fromJson(Map<String, dynamic> json) {
    return TableInfo(
      id: json['id'],
      no: json['no'],
      floor: json['floor'],
      capacity: json['capacity'],
      cigarette: json['cigarette'],
      windowView: json['windowView'],
    );
  }
}

class UserInfo {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;

  UserInfo({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
