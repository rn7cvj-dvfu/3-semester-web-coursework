import 'package:json_annotation/json_annotation.dart';

part '../../gen/shared/models/flight.g.dart';

@JsonSerializable()
class Flight {
  final DateTime date;
  final String from;
  final String to;
  final int flightNumber;
  final int aircraft;
  final int economyPrice;
  final int buisnessPrice;
  final int firstClassPrice;

  final FlightStatus status;

  Flight(
      {required this.date,
      required this.from,
      required this.to,
      required this.flightNumber,
      required this.aircraft,
      required this.economyPrice,
      required this.buisnessPrice,
      required this.firstClassPrice,
      required this.status});

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);

  Map<String, dynamic> toJson() => _$FlightToJson(this);
}

enum FlightStatus {
  @JsonValue(1)
  allowed,

  @JsonValue(2)
  canceled,
}
