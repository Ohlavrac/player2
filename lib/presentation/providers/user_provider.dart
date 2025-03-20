import 'package:flutter/material.dart';
import 'package:player2/presentation/status/bday_status.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/password_status.dart';
import 'package:player2/presentation/status/plataforms_status.dart';
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
  BdayStatus bdayStatus = BdayStatus.unknow;
  PlataformsStatus plataformsStatus = PlataformsStatus.unknow;

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

  void setPlatforms(Map<String, dynamic> value) {
    
    if (value.containsValue(true)) {
      platforms.clear();
      value.forEach((key, value) {
        if (value == true && !platforms.contains(key)) {
          platforms.add(key);
        }
      });
      plataformsStatus = PlataformsStatus.valid;
    } else {
      print("EPA");
      plataformsStatus = PlataformsStatus.invalid;
    }


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
    int currentAge = DateTime.now().year - value.year;

    if (value == null || currentAge < 18) {
      bdayStatus = BdayStatus.invalid;
    } else {
      bday = value;
      bdayStatus = BdayStatus.valid;
    }
    print(bdayStatus);
    notifyListeners();
  }

  void setUserCreatedAt(DateTime value) {
    userCreatedAt = value;
    notifyListeners();
  }
}