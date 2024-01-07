import 'package:json_annotation/json_annotation.dart';

part '../../gen/shared/models/passenger.g.dart';

@JsonSerializable()
class Passenger {
  final String firstName;
  final String lastName;
  final String birthdate;
  final int passportNumber;
  final String passportCountry;
  final int phone;

  Passenger(
      {required this.firstName,
      required this.lastName,
      required this.birthdate,
      required this.passportNumber,
      required this.passportCountry,
      required this.phone});

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
