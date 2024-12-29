class AboutUsResponse {
  final int id;
  final String restaurantName;
  final String address;
  final String number;
  final String email;

  AboutUsResponse({
    required this.id,
    required this.restaurantName,
    required this.address,
    required this.number,
    required this.email,
  });

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) {
    return AboutUsResponse(
      id: json['id'],
      restaurantName: json['restaurantName'],
      address: json['address'],
      number: json['number'],
      email: json['email'],
    );
  }
}
