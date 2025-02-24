import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUserUsecase registerUserUsecase;

  AuthProvider({
    required this.registerUserUsecase,
  });

  Future<void> registerUser(UserEntity user) async {
    try {
      await registerUserUsecase(user);
    } catch(error) {
      throw Exception(error);
    }
    notifyListeners();
  }
}