import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:player2/domain/entities/user_entity.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? username;
  final String? description;
  final String? imageUrl;
  final List<String>? platforms;
  final String? discord;
  final List<int>? postsIds;
  final DateTime? bday;
  final DateTime? userCreatedAt;

  const UserModel({
    this.id,
    this.email,
    this.password,
    this.username,
    this.description,
    this.imageUrl,
    this.platforms,
    this.discord,
    this.postsIds,
    this.bday,
    this.userCreatedAt
  });


  //from firebase data (auth)
  factory UserModel.fromFirebaseAuth(firebase_auth.User firebase) {
    return UserModel(
      id: firebase.uid,
      email: firebase.email,
      username: firebase.displayName,
      imageUrl: firebase.photoURL,
    );
  }


  //from another data source (api)


  //to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      password: password,
      username: username,
      description: description,
      imageUrl: imageUrl,
      platforms: platforms,
      discord: discord,
      postsIds: postsIds,
      bday: bday,
      userCreatedAt: userCreatedAt
    );
  }
}