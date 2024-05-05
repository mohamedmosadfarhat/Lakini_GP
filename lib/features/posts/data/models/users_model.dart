class AllUsers{
  final List<AllUsersData> user;

  AllUsers({required this.user});

  factory AllUsers.fromJson(json){
    List<AllUsersData> user = [];


      user = List<AllUsersData>.from(
        json.map((user) => AllUsersData.fromJson(user)),
      );
return AllUsers(user: user);
  }


}

class AllUsersData {
  final String userName;
  final String email;
  final String phoneNumber;
  final String city;
  final String region;
  final String dateCreated;
  final String userId;
  final String accountPhoto;



  factory AllUsersData.fromJson( json) {
    return AllUsersData(
      userName: json["userName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      city: json["city"],
      region: json["region"],
      dateCreated: json["dateCreated"],
      userId: json["userId"],
      accountPhoto: json["accountPhoto"],
    
    );
  }

  AllUsersData({required this.userName, required this.email, required this.phoneNumber, required this.city, required this.region, required this.dateCreated, required this.userId, required this.accountPhoto});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    data['region'] = region;
    data['dateCreated'] = dateCreated;
    data['userId'] = userId;
    data['accountPhoto'] = accountPhoto;
    return data;
  }
}
