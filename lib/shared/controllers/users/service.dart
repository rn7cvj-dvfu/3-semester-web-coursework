import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/users/service.chopper.dart';

@ChopperApi()
abstract class UsersService extends ChopperService {
  @Get(path: 'user/view')
  Future<Response> getUsers(
    @Query('office_ids') int officeId,
    @Query("type") String type,
  );

  @Post(path: 'user/create')
  Future<Response> createUser(
    @Field('email') String email,
    @Field('password') String password,
    @Field('first_name') String firstName,
    @Field('last_name') String lastName,
    @Field('office_id') int officeId,
    @Field('birthdate') String birthday,
  );

  static UsersService create([ChopperClient? client]) => _$UsersService(client);
}
