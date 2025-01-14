class VerifyEmailResponse {
  final String? message;

  VerifyEmailResponse({
    this.message,
  });

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
