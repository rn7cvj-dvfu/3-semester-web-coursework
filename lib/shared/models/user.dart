import 'package:json_annotation/json_annotation.dart';

part '../../gen/shared/models/user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "FirstName")
  final String firstName;

  @JsonKey(name: "LastName")
  final String lastName;

  @JsonKey(name: "Birthdate")
  final double age;

  @JsonKey(
    name: "Role",
    fromJson: _statusFromJson,
    toJson: _statusToJson,
  )
  final UserStatus status;

  @JsonKey(name: "Email")
  final String email;
  @JsonKey(name: "Office")
  final String office;

  User(
      {required this.firstName,
      required this.lastName,
      required this.status,
      required this.age,
      required this.email,
      required this.office});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

UserStatus _statusFromJson(String status) {
  if (status == "Administrator") return UserStatus.admin;
  return UserStatus.officeUser;
}

String _statusToJson(UserStatus status) {
  if (status == UserStatus.admin) return "Administrator";
  return "User";
}

enum UserStatus {
  @JsonValue(1)
  officeUser,

  @JsonValue(2)
  admin,
}
