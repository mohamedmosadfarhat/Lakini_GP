// class ItemModel {
//   int? itemId;
//   String? itemStatus;
//   String? itemImage;
//   String? categoryName;
//   String? itemName;
//   String? description;
//   String? foundPlace;
//   String? foundDate;
//   String? userId;
//   String? userName;
//   String? email;
//   String? userPlace;
//   String? phoneNumber;
//   String? itemAward;
//   ItemModel({
//     this.itemId,
//     this.itemStatus,
//     this.itemImage,
//     this.categoryName,
//     this.itemName,
//     this.description,
//     this.foundPlace,
//     this.foundDate,
//     this.userId,
//     this.userName,
//     this.email,
//     this.userPlace,
//     this.phoneNumber,
//     this.itemAward,
//   });

//   ItemModel.fromJson(Map<String, dynamic> json) {
//     itemId = json['itemId'];
//     itemStatus = json['itemStatus'];
//     itemImage = json['itemImage'];
//     categoryName = json['categoryName'];
//     itemName = json['itemName'];
//     description = json['description'];
//     foundPlace = json['foundPlace'];
//     foundDate = json['foundDate'];
//     userId = json['userId'];
//     userName = json['userName'];
//     email = json['email'];
//     userPlace = json['userPlace'];
//     phoneNumber = json['phoneNumber'];
//     itemAward = json['itemAward'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['itemId'] = this.itemId;
//     data['itemStatus'] = this.itemStatus;
//     data['itemImage'] = this.itemImage;
//     data['categoryName'] = this.categoryName;
//     data['itemName'] = this.itemName;
//     data['description'] = this.description;
//     data['foundPlace'] = this.foundPlace;
//     data['foundDate'] = this.foundDate;
//     data['userId'] = this.userId;
//     data['userName'] = this.userName;
//     data['email'] = this.email;
//     data['userPlace'] = this.userPlace;
//     data['phoneNumber'] = this.phoneNumber;
//     return data;
//   }
// }
class ItemModel {
  int? itemId;
  String? itemStatus;
  String? itemImage;
  String? userImage;
  String? categoryName;
  String? itemName;
  String? itemAward;
  String? description;
  String? foundPlace;
  String? foundDate;
  String? userId;
  String? userName;
  String? email;
  String? userPlace;
  String? phoneNumber;
  double? itemLatitude;
  double? itemLongitude;
 

  ItemModel(
      {this.itemId,
      this.itemStatus,
      this.itemImage,
      this.categoryName,
      this.itemName,
      this.itemAward,
      this.description,
      this.foundPlace,
      this.foundDate,
      this.userId,
      this.userName,
      this.email,
      this.userPlace,
      this.phoneNumber,
      this.userImage,
       this.itemLatitude,
      this.itemLongitude 
      });

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemStatus = json['itemStatus'];
    itemImage = json['itemImage'];
    userImage = json['userImage'];
    categoryName = json['categoryName'];
    itemName = json['itemName'];
    itemAward = json['itemAward'];
    description = json['description'];
    foundPlace = json['foundPlace'];
    foundDate = json['foundDate'];
    userId = json['userId'];
    userName = json['userName'];
    email = json['email'];
    userPlace = json['userPlace'];
    phoneNumber = json['phoneNumber'];
     itemLatitude = json['latitude'].toDouble();
    itemLongitude = json['longitude'].toDouble(); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['itemStatus'] = this.itemStatus;
    data['itemImage'] = itemImage;
    data['userImage'] = this.itemImage;
    data['categoryName'] = this.categoryName;
    data['itemName'] = this.itemName;
    data['itemAward'] = this.itemAward;
    data['description'] = this.description;
    data['foundPlace'] = this.foundPlace;
    data['foundDate'] = this.foundDate;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['userPlace'] = this.userPlace;
    data['phoneNumber'] = this.phoneNumber;
    data['latitude'] = this.itemLatitude;
    data['longitude'] = this.itemLongitude; 
    return data;
  }
}
