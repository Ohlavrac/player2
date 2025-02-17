class PostModel {
  final int? id;
  final int? authorId;
  final String? title;
  final String? content;
  final String? plataform;
  final String? game;
  final DateTime? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PostModel({
    this.id,
    this.authorId,
    this.title,
    this.content,
    this.plataform,
    this.game,
    this.date,
    this.createdAt,
    this.updatedAt
  });

  //from firebase storage

  //from api

  //to entity
}