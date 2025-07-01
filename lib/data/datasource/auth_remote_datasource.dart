import 'package:firebase_auth/firebase_auth.dart';
import 'package:player2/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> createNewUser({required UserModel usermodel});
  Future<UserModel> loginWithEmailAndPassword({required String email, required String password});
  Future<UserModel?> getLoggedUser();
  Future<void> logout();
  Stream<User?> authStateChanges();
}