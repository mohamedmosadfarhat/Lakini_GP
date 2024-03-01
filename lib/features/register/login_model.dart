class UserData {
  final bool status;
  final String message;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? city;
  final String? token;

  factory UserData.fromJson(Map<String, dynamic>? json) {
    return UserData(
      status: json?["status"],
      message: json?["message"],
      userName: json?["userName"],
      email: json?["email"],
      phoneNumber: json?["phoneNumber"],
      city: json?["city"],
      token: json?["jwt"],
    );
  }

  UserData(
      {
        required this.status,
        required this.message,
        required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.city,
      required this.token});
}
