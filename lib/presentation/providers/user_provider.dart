import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late final String _email;
  late final String _password;
  late final String _username;
  late final String _description;
  late final String _imageUrl;
  late final List<String> _platforms;
  late final String _discord;
  late final List<int> _postsIds;
  late final DateTime _bday;
  late final DateTime _userCreatedAt;

  String get email => _email;
  String get password => _password; 
  String get username => _username; 
  String get description => _description;
  String get imageUrl => _imageUrl;
  List<String> get platforms => _platforms;
  String get discord => _discord;
  List<int> get postsIds => _postsIds;
  DateTime get bday => _bday;
  DateTime get userCreatedAt => _userCreatedAt;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  void setImageUrl(String value) {
    _imageUrl = value;
    notifyListeners();
  }

  void setPlatforms(List<String> value) {
    _platforms = value;
    notifyListeners();
  }

  void setDiscord(String value) {
    _discord = value;
    notifyListeners();
  }

  void setPostsIds(List<int> value) {
    _postsIds = value;
    notifyListeners();
  }

  void setBday(DateTime value) {
    _bday = value;
    notifyListeners();
  }

  void setUserCreatedAt(DateTime value) {
    _userCreatedAt = value;
    notifyListeners();
  }
}