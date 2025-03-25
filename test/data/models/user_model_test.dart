import 'package:flutter_test/flutter_test.dart';
import 'package:player2/data/models/user_model.dart';
import 'package:player2/domain/entities/user_entity.dart';

void main() {
  const id = "testId";
  const email = "testefakeemail@email.com";
  const password = "fakepassword";
  const username = "testusername";
  const description = "test description";
  const imageUrl = "http://exampleimageurl/image.jpg";
  const platforms = ["computer", "PS5"];
  const discord = "testeDiscord";
  const postsIds = [1, 2, 3];
  const bday = DateTime;
  const userCreatedAt = DateTime;

  const userModel = UserModel(
    id: id,
    email: email,
    password: password,
    username: username,
    description: description,
    imageUrl: imageUrl,
    platforms: platforms,
    discord: discord,
    postsIds: postsIds,
    //bday: bday,
    //suserCreatedAt: userCreatedAt
  );

  group("UserModelTests", () {
    test("SHOULD RETURN USER ENTITY WHEN USE ToEntity Func", () {
      final user = userModel.toEntity();
      
      expect(user is UserEntity, true);
    });

    test("SHOULD RETURN FALSE IF toEntity RETURN USERMODEL", () {
      final user = userModel.toEntity();

      expect(user is UserModel, false);
    });
  });
}