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
