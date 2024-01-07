import 'package:json_annotation/json_annotation.dart';

part '../../gen/shared/models/outbound.g.dart';

@JsonSerializable()
class Outbound {
  final String from;
  final String to;
  final DateTime date;
  final int flightNumber;
  final int cabinPrice;
  final int numberOfStops;

  Outbound(
      {required this.from,
      required this.to,
      required this.date,
      required this.flightNumber,
      required this.cabinPrice,
      required this.numberOfStops});

  factory Outbound.fromJson(Map<String, dynamic> json) =>
      _$OutboundFromJson(json);

  Map<String, dynamic> toJson() => _$OutboundToJson(this);
}
