class UserEntity {
  final int? id;
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

  const UserEntity({
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
}