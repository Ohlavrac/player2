class FirebaseCustomExcetions implements Exception {
  String message;
  FirebaseCustomExcetions(this.message);

  @override
  String toString() => message;
}