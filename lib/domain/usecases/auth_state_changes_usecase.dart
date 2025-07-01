import 'package:firebase_auth/firebase_auth.dart';
import 'package:player2/domain/repositories/auth_repository.dart';

class AuthStateChangesUsecase {
  final AuthRepository repository;

  AuthStateChangesUsecase({
    required this.repository
  });

  Stream<User?> call() {
    return repository.authStateChanges();
  }
}