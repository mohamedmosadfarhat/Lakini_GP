class AppModel {
  final bool status;
  final String message;

  AppModel({required this.status, required this.message});

  factory AppModel.fromJson(json) {
    return AppModel(
      status: json["status"],
      message: json["message"],
    );
  }
}
