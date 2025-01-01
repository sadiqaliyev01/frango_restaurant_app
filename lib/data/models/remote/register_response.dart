class RegisterResponse {
  final String? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? phoneNumber;
  final List<AddressList>? addressList;
  final DateTime? birthDate;

  RegisterResponse({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.addressList,
    this.birthDate,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    addressList: json["addressList"] == null ? [] : List<AddressList>.from(json["addressList"]!.map((x) => AddressList.fromJson(x))),
    birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "email": email,
    "phoneNumber": phoneNumber,
    "addressList": addressList == null ? [] : List<dynamic>.from(addressList!.map((x) => x.toJson())),
    "birthDate": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
  };
}

class AddressList {
  final String? id;
  final String? name;
  final String? city;
  final String? street;
  final String? apartment;
  final String? addressType;

  AddressList({
    this.id,
    this.name,
    this.city,
    this.street,
    this.apartment,
    this.addressType,
  });

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    street: json["street"],
    apartment: json["apartment"],
    addressType: json["addressType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "street": street,
    "apartment": apartment,
    "addressType": addressType,
  };
}
