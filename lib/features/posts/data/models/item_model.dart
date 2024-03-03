class Item {
  final String name;
  final String description;
  final String status;
  final String award;
  final String imagePhoto;
  final String foundPlace;
  final String foundDate;
  final int categoryId;
  final String phoneNumber;
  final String userId;
  final int id;
  Item({
    required this.name,
    required this.description,
    required this.status,
    required this.award,
    required this.imagePhoto,
    required this.foundPlace,
    required this.foundDate,
    required this.phoneNumber,
    required this.categoryId,
    required this.userId,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['value']['item']['id'],
      name: json['value']['item']['name'],
      description: json['value']['item']['description'],
      status: json['value']['item']['status'],
      award: json['value']['item']['award'],
      imagePhoto: json['value']['item']['imagePhoto'],
      foundPlace: json['value']['item']['foundPlace'],
      foundDate: json['value']['item']['foundDate'],
      categoryId: json['value']['item']['categoryId'],
      phoneNumber: json['value']['item']['phoneNumber'],
      userId: json['value']['item']['userId'],
    );
  }
/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemName'] = name;
    data['description'] = description;
    data['itemStatus'] = status;
    data['itemAward'] = award;
    data['imagePhoto'] = imagePhoto;
    data['foundPlace'] = foundPlace;
    data['phoneNumber'] = phoneNumber;
    return data;
  }*/
}
