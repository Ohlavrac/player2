import 'package:flutter_test/flutter_test.dart';
import 'package:player2/domain/entities/user_entity.dart';

void main() {

  var user = UserEntity(
    id: "testID",
    email: "email@email.com",
    password: "testesenha",
    username: "test username",
    description: "test description",
    imageUrl: "http://example.image/foto.png",
    platforms: ["computer", "PS5"],
    discord: "discordtest",
    postsIds: [1, 2, 3],
    bday: DateTime(2002, 9, 7, 17, 30),
    userCreatedAt: DateTime.now()
  );

  test("VERIFY IF EMPTY FIELDS EXPECT NULL", () {
    expect(UserEntity().email, equals(null));
    expect(UserEntity().password, equals(null));
    expect(UserEntity().username, equals(null));
    expect(UserEntity().description, equals(null));
    expect(UserEntity().platforms, equals(null));
    expect(UserEntity().bday, equals(null));
    expect(UserEntity().imageUrl, equals(null));
    expect(UserEntity().discord, equals(null));
    expect(UserEntity().postsIds?.isEmpty, equals(null));
    expect(UserEntity().userCreatedAt, equals(null));
  });

  test("VERIFY IF NOT EMPTY FIELDS EXPECT NOT NULL", () {
    expect(user.email, isNot(equals(null)));
    expect(user.password, isNot(equals(null)));
    expect(user.username, isNot(equals(null)));
    expect(user.description, isNot(equals(null)));
    expect(user.platforms, isNot(equals(null)));
    expect(user.bday, isNot(equals(null)));
    expect(user.imageUrl, isNot(equals(null)));
    expect(user.discord, isNot(equals(null)));
    expect(user.postsIds?.isEmpty, isNot(equals(null)));
    expect(user.userCreatedAt, isNot(equals(null)));
  });
}