import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUserUsecase _registerUserUsecase;

  AuthProvider({
    required RegisterUserUsecase registerUserUsecase,
  }) : _registerUserUsecase = registerUserUsecase;

  Future<void> registerUser(UserEntity user) async {
    try {
      await _registerUserUsecase(user);
    } catch(error) {
      throw Exception(error);
    }
    notifyListeners();
  }
}