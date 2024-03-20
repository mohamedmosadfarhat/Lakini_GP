

class ProfileModet {
  final String userName;
  final String email;
  final dynamic phone;
  final String city;
  final String region;
  final dynamic accountPhoto;

  ProfileModet({
    required this.userName,
    required this.email,
    required this.phone,
    required this.city,
    required this.region,
    required this.accountPhoto,
  });

  factory ProfileModet.fromJson(json) {
    return ProfileModet(
      userName: json["userName"],
      email: json["email"],
      phone: json["phone"],
      city: json["city"],
      region: json["region"],
      accountPhoto: json["accountPhoto"]??"Anonymous-man.png",
    );
  }
}
