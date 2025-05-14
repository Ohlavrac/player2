import 'package:flutter/material.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/presentation/ui/home/home_page.dart';
import 'package:player2/presentation/ui/login/login_page.dart';
import 'package:player2/presentation/ui/register/register_completed_page.dart';
import 'package:player2/presentation/ui/register/register_page.dart';
import 'package:player2/presentation/ui/register/register_page_2.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/user_provider.dart';

class AppWidget extends StatelessWidget {
  final AuthRepository authRepository;

  const AppWidget({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider.value(value: authRepository),
        ChangeNotifierProvider(create: (context) => UserProvider(),),
      ],
      child: MaterialApp(
        initialRoute: "/login",
        routes: {
          "/": (context) => HomePage(),
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/register/informations": (context) => RegisterPage2(),
          "/register/completed": (context) => RegisterCompletedPage()
        },
      ),
    );
  }
}