import 'package:json_annotation/json_annotation.dart';

part '../../gen/shared/models/office.g.dart';

@JsonSerializable()
class Office {
  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Phone')
  final String phone;

  @JsonKey(name: 'Contact')
  final String contact;

  @JsonKey(name: 'CountryName')
  final String countryName;

  Office(this.title, this.phone, this.contact,
      {required this.id, required this.countryName});

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}
