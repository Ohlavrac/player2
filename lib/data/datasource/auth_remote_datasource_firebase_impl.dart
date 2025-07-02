import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:player2/data/datasource/auth_remote_datasource.dart';
import 'package:player2/data/exceptions/firebase_custom_excetions.dart';
import 'package:player2/data/models/user_model.dart';

class AuthRemoteDatasourceFirebaseImpl implements AuthRemoteDatasource {

  AuthRemoteDatasourceFirebaseImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
      _firebaseDB = firebaseFirestore ?? FirebaseFirestore.instance;
  
  final firebase_auth.FirebaseAuth _firebaseAuth;
    final FirebaseFirestore _firebaseDB;

  @override
  Future<UserModel> createNewUser({required UserModel usermodel}) async {

    try {
      firebase_auth.UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: usermodel.email!,
        password: usermodel.password!,
      );

      if (userCredential.user == null) {
        throw Exception("Error registering new user");
      }

      userCredential.user!.updateDisplayName(usermodel.username);

      Map<String, dynamic> userData = {
        "user_id": userCredential.user!.uid,
        "username": usermodel.username,
        "description": usermodel.description,
        "image_url": usermodel.imageUrl,
        "plataforms": usermodel.platforms,
        "discord": usermodel.discord,
        "posts_ids": usermodel.postsIds,
        "b_day": usermodel.bday,
        "user_created_at": DateTime.now()
      };

      await _firebaseDB.collection("users").add(userData).then((DocumentReference doc) => print("Document added with ID: $doc"));
    } catch (error) {
      throw Exception("Erro while create a user: $error");
    }

    return usermodel;
  }
  
  @override
  Future<UserModel> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return UserModel.fromFirebaseAuth(credential.user!);
    } on FirebaseException catch (error) {
      if (error.code == "user-not-found") {
        throw FirebaseCustomExcetions("User not found: ${error.message}");
      } else if (error.code == "wrong-password") {
        throw FirebaseCustomExcetions("Wrong password: ${error.message}");
      } else {
        throw FirebaseCustomExcetions("Error: ${error.message}");
      }
    }
  }
  
  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
  
  @override
  Future<UserModel?> getLoggedUser() async {
    
    final user = _firebaseAuth.currentUser;
    final userDataFromFireStore = await _firebaseDB.collection("users").where("user_id", isEqualTo: user?.uid).get();
    final docs = userDataFromFireStore.docs;

    if (user == null) {
      return null;
    }

    final List<String>? plataforms = (docs.first["plataforms"] as List<dynamic>?)?.map((platform) => platform.toString()).toList();
    final DateTime bday = (docs.first["b_day"] as Timestamp).toDate();
    final DateTime createdAt = (docs.first["user_created_at"] as Timestamp).toDate();

    UserModel userModel = UserModel(
      id: user.uid,
      email: user.email,
      username: user.displayName,
      imageUrl: user.photoURL,
      description: userDataFromFireStore.docs.first["description"],
      platforms: plataforms,
      discord: userDataFromFireStore.docs.first["discord"],
      postsIds: docs.first["posts_ids"],
      bday: bday,
      userCreatedAt: createdAt
    );

    return userModel;
  }
  
  @override
  Stream<firebase_auth.User?> authStateChanges() async* {
    yield* _firebaseAuth.authStateChanges();
  }
}