import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/usecases/auth_state_changes_usecase.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUserUsecase? registerUserUsecase;
  final AuthStateChangesUsecase? authStateChangesUsecase;

  AuthProvider({
    this.registerUserUsecase,
    this.authStateChangesUsecase
  });

  Future<void> registerUser(UserEntity user) async {
    try {
      await registerUserUsecase!(user);
    } catch(error) {
      throw Exception(error);
    }
    notifyListeners();
  }

  Stream<User?> authStateChanges() async* {
    yield* authStateChangesUsecase!.call();
  }
}