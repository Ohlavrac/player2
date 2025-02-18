import 'package:player2/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> registerNewUser({
    required UserEntity userEntity
  });
}