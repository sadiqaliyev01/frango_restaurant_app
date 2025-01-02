class LoginResponse {
  final String? token;
  final String? role;

  LoginResponse({
    this.token,
    this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "role": role,
  };
}

class Tokens {
  final String refresh;
  final String access;

  Tokens({
    required this.refresh,
    required this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}