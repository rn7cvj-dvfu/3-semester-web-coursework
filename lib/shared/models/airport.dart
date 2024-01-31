import 'package:json_annotation/json_annotation.dart';

part '../../gen/shared/models/airport.g.dart';

@JsonSerializable()
class Airport {
  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'IATACode')
  final String code;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'CountryName')
  final String countryName;

  Airport(
      {required this.id,
      required this.code,
      required this.name,
      required this.countryName});

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);

  Map<String, dynamic> toJson() => _$AirportToJson(this);
}
