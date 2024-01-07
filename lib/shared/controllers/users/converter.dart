import 'package:chopper/chopper.dart';
import 'package:web_susch/logger.dart';
import 'package:web_susch/shared/controllers/users/service.dart';
import 'package:web_susch/shared/models/user.dart';

class UsersConverter {
  final UsersService _usersService;

  UsersConverter({required UsersService usersService})
      : _usersService = usersService;

  Future<UsersResponse> getUsers(int officeId) async {
    Response response;

    try {
      response = await _usersService.getUsers(officeId, "admin");
    } catch (e) {
      return UsersResponse(
        isSuccessful: false,
        users: null,
      );
    }

    List<User> users = _parseUsers(response);

    return UsersResponse(
      isSuccessful: true,
      users: users,
    );
  }

  Future<void> craeteUser(
    String email,
    String password,
    String firstName,
    String lastName,
    int officeId,
    String birthDay,
  ) async {
    Response response;

    try {
      response = await _usersService.createUser(
        email,
        password,
        firstName,
        lastName,
        officeId,
        birthDay,
      );
    } catch (e) {
      return;
    }
  }

  List<User> _parseUsers(Response response) {
    List<dynamic> users = response.body;

    return users.map((user) => User.fromJson(user)).toList();
  }
}

class UsersResponse {
  final bool isSuccessful;
  final List<User>? users;
  UsersResponse({
    required this.isSuccessful,
    required this.users,
  });
}
