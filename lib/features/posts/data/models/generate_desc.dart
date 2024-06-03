class GenerateDesc {
  List<String>? objects;
  List<String>? type;
  String? description;
  String? briefDescription;

  GenerateDesc({
    this.objects,
    this.type,
    this.description,
    this.briefDescription,
  });

  factory GenerateDesc.fromJson(Map<String, dynamic> json) => GenerateDesc(
        objects: json['objects'] as List<String>?,
        type: json['type'] as List<String>?,
        description: json['description'] as String?,
        briefDescription: json['Brief description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'objects': objects,
        'type': type,
        'description': description,
        'Brief description': briefDescription,
      };
}
