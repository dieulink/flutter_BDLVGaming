class ResetPasswordRequest {
  final String otp;
  final String email;
  final String password;

  ResetPasswordRequest({
    required this.otp,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'otp': otp,
    'email': email,
    'password': password,
  };
}
