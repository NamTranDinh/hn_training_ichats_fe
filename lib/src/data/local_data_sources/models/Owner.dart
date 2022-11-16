class Owner {
  Owner({
    required this.avatar,
    required this.name,
    required this.id,
    required this.sex,
  });

  Owner.fromJson(dynamic json) {
    avatar = json['avatar'];
    name = json['name'];
    id = json['id'];
    sex = json['sex'];
  }

  late String avatar;
  late String name;
  late String id;
  late int sex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = avatar;
    map['name'] = name;
    map['id'] = id;
    map['sex'] = sex;
    return map;
  }
}
