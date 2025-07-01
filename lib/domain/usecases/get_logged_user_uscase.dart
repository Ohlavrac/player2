import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/repositories/auth_repository.dart';

class GetLoggedUserUscase  {
  final AuthRepository repository;

  GetLoggedUserUscase({
    required this.repository
  });


  Future<UserEntity?> call() async {
    return await repository.getLoggedUser();
  }
}