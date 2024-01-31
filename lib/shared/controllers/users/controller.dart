import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/controllers/users/converter.dart';
import 'package:web_susch/shared/models/user.dart';

part '../../../gen/shared/controllers/users/controller.g.dart';

class UsersController = UsersControllerBase with _$UsersController;

abstract class UsersControllerBase with Store {
  final UsersConverter _usersConverter;

  UsersControllerBase({required UsersConverter usersConverter})
      : _usersConverter = usersConverter;

  @observable
  bool isLoading = true;

  @observable
  bool isUserAdding = false;

  @observable
  List<User> users = [];

  int selectedOfficeId = 1;

  @action
  Future<void> getUsers() async {
    isLoading = true;

    UsersResponse response = await _usersConverter.getUsers(selectedOfficeId);

    if (response.isSuccessful) {
      users = response.users!;
    }

    isLoading = false;
  }

  String newUserEmail = "";
  String newUserPassword = "";
  String newUserFirstName = "";
  String newUserLastName = "";
  DateTime newUserBirthday = DateTime.now();
  int newUserOfficeId = 1;

  Future<void> craeteUser() async {
    await _usersConverter.craeteUser(
      newUserEmail,
      newUserPassword,
      newUserFirstName,
      newUserLastName,
      newUserOfficeId,
      "${newUserBirthday.year}-${newUserBirthday.month}-${newUserBirthday.day}",
    );
  }
}
