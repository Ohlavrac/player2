import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/usecases/login_user_usecase.dart';

class AuthLoginProvider extends ChangeNotifier {
  final LoginUserUsecase loginUserUsecase;

  AuthLoginProvider({
    required this.loginUserUsecase
  });

  Future<void> login(UserEntity user) async {
    try {
      await loginUserUsecase(user);
    } on ArgumentError catch (error) {
      throw Exception(error.message);
    }
  }
}