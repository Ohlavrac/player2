import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:player2/data/datasource/auth_remote_datasource_firebase_impl.dart';
import 'package:player2/data/models/user_model.dart';

@GenerateMocks([
  firebase_auth.FirebaseAuth,
  firebase_auth.User,
  firebase_auth.UserCredential,
  FirebaseFirestore,
  //CollectionReference,
  DocumentReference
], customMocks: [
  MockSpec<CollectionReference<Map<String, dynamic>>>(as: #MockCollectionReference)
])

import 'auth_remote_datasource_firebase_test.mocks.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late AuthRemoteDatasourceFirebaseImpl authRemoteDatasourceFirebaseImpl;

  setUp(() {

    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();

    when(mockUser.uid).thenReturn('test_uid');
    when(mockUser.email).thenReturn('test_email');
    when(mockUser.displayName).thenReturn('test_username');
    when(mockUser.photoURL).thenReturn('test_photoURL');

    authRemoteDatasourceFirebaseImpl = AuthRemoteDatasourceFirebaseImpl(firebaseAuth: mockFirebaseAuth, firebaseFirestore: mockFirebaseFirestore);
  });

  const email = "fakemail@gmail.com";
  const password = "fakepassword#";
  const username = "testusername";
  const description = "test description";
  const imageUrl = "http://exampleimageurl/image.jpg";
  const platforms = ["computer", "PS5"];
  const discord = "testeDiscord";
  final bday = DateTime(2002, 9, 7, 17, 30);

  group("REGISTER USER TESTS", () {

    test("SHOULD RETURN USER MODEL SIMILAR TO USERFAKE WHEN REGISTER IS SUCCESSFUL", () async {
      UserModel fakeUser = UserModel(
        email: email,
        password: password,
        username: username,
        description: description,
        imageUrl: imageUrl,
        platforms: platforms,
        discord: discord,
        postsIds: [],
        bday: bday,
      );

      when(
        mockFirebaseAuth.createUserWithEmailAndPassword(
          email: fakeUser.email, password: fakeUser.password
        ),
      ).thenAnswer((_) async => mockUserCredential);

      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn("123456");

      when(mockFirebaseFirestore.collection("users")).thenReturn(mockCollectionReference);
      when(mockCollectionReference.add(any)).thenAnswer((_) async => mockDocumentReference);  

      final result = await  authRemoteDatasourceFirebaseImpl.createNewUser(usermodel: fakeUser);

      verify(mockFirebaseAuth.createUserWithEmailAndPassword(email: fakeUser.email, password: fakeUser.password)).called(1);
      verify(mockCollectionReference.add(any)).called(1);

      expect(result, equals(fakeUser));
    });
  });
}