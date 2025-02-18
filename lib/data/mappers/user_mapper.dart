import 'package:player2/data/models/user_model.dart';
import 'package:player2/domain/entities/user_entity.dart';

class UserMapper {
  UserModel fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      password: userEntity.password,
      username: userEntity.username,
      description: userEntity.description,
      imageUrl: userEntity.imageUrl,
      platforms: userEntity.platforms,
      discord: userEntity.discord,
      postsIds: userEntity.postsIds,
      bday: userEntity.bday,
      userCreatedAt: userEntity.userCreatedAt
    );
  }
}