import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String email = "";
  String password = "";
  String username = "";
  String description = "";
  String imageUrl = "";
  List<String> platforms = [];
  String discord = "";
  List<int> postsIds = [];
  DateTime bday = DateTime.now();
  DateTime userCreatedAt = DateTime.now();

  String get getemail => email;
  String get getpassword => password; 
  String get getusername => username; 
  String get getdescription => description;
  String get getimageUrl => imageUrl;
  List<String> get getplatforms => platforms;
  String get getdiscord => discord;
  List<int> get getpostsIds => postsIds;
  DateTime get getbday => bday;
  DateTime get getuserCreatedAt => userCreatedAt;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setDescription(String value) {
    description = value;
    notifyListeners();
  }

  void setImageUrl(String value) {
    imageUrl = value;
    notifyListeners();
  }

  void setPlatforms(List<String> value) {
    platforms = value;
    notifyListeners();
  }

  void setDiscord(String value) {
    discord = value;
    notifyListeners();
  }

  void setPostsIds(List<int> value) {
    postsIds = value;
    notifyListeners();
  }

  void setBday(DateTime value) {
    bday = value;
    notifyListeners();
  }

  void setUserCreatedAt(DateTime value) {
    userCreatedAt = value;
    notifyListeners();
  }
}