class AboutUs {
  final int id;
  final String restaurantName;
  final String address;
  final String number;
  final String email;

  AboutUs({
    required this.id,
    required this.restaurantName,
    required this.address,
    required this.number,
    required this.email,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) {
    return AboutUs(
      id: json['id'],
      restaurantName: json['restaurantName'],
      address: json['address'],
      number: json['number'],
      email: json['email'],
    );
  }
}
