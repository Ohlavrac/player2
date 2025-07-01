import 'package:firebase_auth/firebase_auth.dart';
import 'package:player2/data/datasource/auth_remote_datasource.dart';
import 'package:player2/data/mappers/user_mapper.dart';
import 'package:player2/data/models/user_model.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  const AuthRepositoryImpl({
    required this.authRemoteDatasource
  });
        
  @override
  Future<UserEntity> registerNewUser({required UserEntity userEntity}) async {
    UserModel userModel = UserMapper().fromEntity(userEntity);
    final user = await authRemoteDatasource.createNewUser(usermodel: userModel);

    //FICAR ATENTO AQUI
    return user.toEntity();
  }
  
  @override
  Future<UserEntity> login({required UserEntity userEntity}) async {
    UserModel userModel = UserMapper().fromEntity(userEntity);
    final user = await authRemoteDatasource.loginWithEmailAndPassword(email: userModel.email!, password: userModel.password!);

    return user.toEntity();
  }
  
  @override
  Future<UserEntity?> getLoggedUser() async {
    UserModel? user = await authRemoteDatasource.getLoggedUser();
    return user?.toEntity();
  }
  
  @override
  Future<void> logout() async {
    await authRemoteDatasource.logout();
  }

  @override
  Stream<User?> authStateChanges() async* {
    var result = authRemoteDatasource.authStateChanges();
    yield* result;
  }

}