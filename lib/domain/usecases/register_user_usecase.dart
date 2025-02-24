import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/repositories/auth_repository.dart';

class RegisterUserUsecase {
  final AuthRepository repository;

  RegisterUserUsecase({
    required this.repository
  });

  Future<UserEntity> call(UserEntity userEntity) async {
    try {
      return await repository.registerNewUser(userEntity: userEntity);
    } catch (error) {
      throw Exception(error);
    }
  }
}