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

}