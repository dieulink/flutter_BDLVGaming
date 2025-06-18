class UserProfile {
  final int userId;
  final String username;
  final String email;
  final String phone;

  UserProfile({
    required this.userId,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
