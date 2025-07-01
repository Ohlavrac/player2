import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/usecases/get_logged_user_uscase.dart';
import 'package:player2/domain/usecases/logout_usecase.dart';
import 'package:player2/presentation/status/bday_status.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/password_status.dart';
import 'package:player2/presentation/status/plataforms_status.dart';
import 'package:player2/presentation/status/username_status.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? user;

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

  final GetLoggedUserUscase? getLoggedUserUscase;
  final LogoutUsecase logoutUsecase;

  UserProvider({
    this.getLoggedUserUscase,
    required this.logoutUsecase
  }) {
    getLoggedUser();
  }

  Future<void> getLoggedUser() async {
    user = await getLoggedUserUscase!.call();
    notifyListeners();
  }

  Future<void> logoutUser() async {
    await logoutUsecase.call();
    notifyListeners();
  }

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

    if (currentAge < 18) {
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

  void cleanUserProdiver() {
    email = "";
    password = "";
    username = "";
    description = "";
    imageUrl = "";
    platforms = [];
    discord = "";
    postsIds = [];
    bday = DateTime.now();
    userCreatedAt = DateTime.now();
    notifyListeners();
  }

  void resetAllStatus() {
    usernameStatus = UsernameStatus.unknow;
    emailStatus = EmailStatus.unknow;
    passwordStatus = PasswordStatus.unknow;
    bdayStatus = BdayStatus.unknow;
    plataformsStatus = PlataformsStatus.unknow;
    notifyListeners();
  }

  //VERIFY A GROUP OF FIELDS PASS BY PARAM
  void verifyFields(List<String> fields) {
    for (int c = 0; c < fields.length; c++) {
      switch (fields[c]) {
        case "email":
          email.isEmpty ? emailStatus = EmailStatus.invalid : null;
          continue;
        case "password":
          password.isEmpty ? passwordStatus = PasswordStatus.short : null;
          continue;
        case "username":
          username.isEmpty ? usernameStatus = UsernameStatus.invalid : null;
          continue;
        case "description":
          //description.isEmpty ? descriptionStatus = DescriptionStatus.invalid : null;
          continue;
        case "imageUrl":
          continue;
        case "discord":
          continue;
        case "platforms":
          platforms.isEmpty ? plataformsStatus = PlataformsStatus.invalid: null;
          continue;
        case "bday":
          bday.year == DateTime.now().year || bday.year.isNaN ? bdayStatus = BdayStatus.invalid : null;
          continue;
        default:
          break;
      }
    }
  }


}