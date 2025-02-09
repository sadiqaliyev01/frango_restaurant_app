class TableResponse {
  final String? id;
  final int? no;
  final int? floor;
  final int? capacity;
  final bool? cigarette;
  final bool? windowView;

  TableResponse({
    this.id,
    this.no,
    this.floor,
    this.capacity,
    this.cigarette,
    this.windowView,
  });

  factory TableResponse.fromJson(Map<String, dynamic> json) => TableResponse(
        id: json["id"],
        no: json["no"],
        floor: json["floor"],
        capacity: json["capacity"],
        cigarette: json["cigarette"],
        windowView: json["windowView"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "floor": floor,
        "capacity": capacity,
        "cigarette": cigarette,
        "windowView": windowView,
      };
}
