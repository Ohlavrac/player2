import 'package:player2/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> createNewUser({required UserModel usermodel});
  Future<UserModel> loginWithEmailAndPassword({required String email, required String password});
  Future<void> logout();
}