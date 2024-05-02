import 'dart:convert';

class ImageModel {
  List<String>? imagesLinks;

  ImageModel({this.imagesLinks});

  factory ImageModel.fromMap(Map<String, dynamic> data) => ImageModel(
        imagesLinks: data['images_links'],
      );

  Map<String, dynamic> toMap() => {
        'images_links': imagesLinks,
      };
}
