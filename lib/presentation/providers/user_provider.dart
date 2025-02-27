import 'package:flutter/material.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/password_status.dart';
import 'package:player2/presentation/status/username_status.dart';

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

  UsernameStatus usernameStatus = UsernameStatus.unknow;
  EmailStatus emailStatus = EmailStatus.unknow;
  PasswordStatus passwordStatus = PasswordStatus.unknow;

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
    if (value.contains(RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com(\.br)?$'))) {
      emailStatus = EmailStatus.valid;
      email = value;
    } else {
      emailStatus = EmailStatus.invalid;
    }
    notifyListeners();
  }

  void setPassword(String value) {
    if (value.length < 8) {
      passwordStatus = PasswordStatus.short;
    } else if (value.length >= 8 && value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      passwordStatus = PasswordStatus.valid;
      password = value;
    } else {
      passwordStatus = PasswordStatus.needSymble;
    }
    notifyListeners();
  }

  void setUsername(String value) {
    if (value.length < 3) {
      usernameStatus = UsernameStatus.invalid;
    } else if (value.isEmpty || value == "") {
      usernameStatus = UsernameStatus.unknow;
    } else {
      usernameStatus = UsernameStatus.valid;
      username = value;
    }
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