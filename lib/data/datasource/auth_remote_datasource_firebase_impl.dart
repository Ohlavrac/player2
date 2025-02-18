import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:player2/data/datasource/auth_remote_datasource.dart';
import 'package:player2/data/models/user_model.dart';

class AuthRemoteDatasourceFirebaseImpl implements AuthRemoteDatasource {

  AuthRemoteDatasourceFirebaseImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final firebaseDB = FirebaseFirestore.instance;

  @override
  Future<UserModel> createNewUser({required UserModel usermodel}) async {

    try {
      firebase_auth.UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: usermodel.email!,
        password: usermodel.password!
      ); 

      if (userCredential.user == null) {
        throw Exception("Error registering new user");
      }

      Map<String, dynamic> userData = {
        "user_id": userCredential.user!.uid,
        "username": usermodel.username,
        "description": usermodel.description,
        "image_url": usermodel.imageUrl,
        "plataforms": usermodel.platforms,
        "discord": usermodel.discord,
        "posts_ids": usermodel.postsIds,
        "b_day": usermodel.bday,
        "user_created_at": usermodel.userCreatedAt
      };

      firebaseDB.collection("users").add(userData).then((DocumentReference doc) => print("Document added with ID: $doc"));

    } catch (error) {
      throw Exception("Erro while create a user: $error");
    }

    // TODO: implement createNewUser
    throw UnimplementedError();
  }
}