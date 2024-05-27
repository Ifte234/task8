import 'package:json_annotation/json_annotation.dart';
part 'person_model.g.dart';
@JsonSerializable()
class PersonModel {
  // NameModel? name;
  final String? phone;
  final String? email;
  // PictureModel? picture;
  PersonModel({ this.email, this.phone, });
  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
