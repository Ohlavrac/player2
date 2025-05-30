import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/repositories/auth_repository.dart';

class LoginUserUsecase {
  final AuthRepository authRepository;

  LoginUserUsecase({
    required this.authRepository
  });

  Future<UserEntity> call(UserEntity userEntity) async {
    try {
      return await authRepository.login(userEntity: userEntity);
    } on ArgumentError catch (error) {
      throw Exception(error.message);
    }
  }
}