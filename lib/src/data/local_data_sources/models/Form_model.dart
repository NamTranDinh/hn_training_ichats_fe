import 'AdditionalInfomation.dart';
import 'Owner.dart';

class FormModel {
  FormModel({
    required this.additionalInfomation,
    required this.owner,
  });

  FormModel.fromJson(dynamic json) {
    additionalInfomation = (json['additionalInfomation'] != null
        ? AdditionalInfomation.fromJson(json['additionalInfomation'])
        : null)!;
    owner = (json['owner'] != null ? Owner.fromJson(json['owner']) : null)!;
  }

  late AdditionalInfomation additionalInfomation;
  late Owner owner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['additionalInfomation'] = additionalInfomation.toJson();
    map['owner'] = owner.toJson();
    return map;
  }
}
