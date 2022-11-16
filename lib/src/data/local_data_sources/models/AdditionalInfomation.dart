import 'Hometown.dart';

class AdditionalInfomation {
  AdditionalInfomation({
    required this.fulname,
    required this.hometown,
  });

  AdditionalInfomation.fromJson(dynamic json) {
    fulname = json['fulname'];
    hometown = (json['hometown'] != null
        ? Hometown.fromJson(json['hometown'])
        : null)!;
  }

  late String fulname;
  late Hometown hometown;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fulname'] = fulname;
    if (hometown != null) {
      map['hometown'] = hometown.toJson();
    }
    return map;
  }
}
