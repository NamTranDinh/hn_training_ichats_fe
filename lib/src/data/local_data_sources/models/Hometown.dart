class Hometown {
  Hometown({
    required this.code,
    required this.name,
  });

  Hometown.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
  }

  late String code;
  late String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    return map;
  }
}
