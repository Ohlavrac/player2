import 'package:player2/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase({
    required this.repository
  });

  Future<void> call() async {
    try {
      return await repository.logout();
    } catch (error) {
      throw Exception(error);
    }
  }
}