import 'package:flutter/material.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/presentation/ui/register/register_page.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/user_provider.dart';
import 'presentation/ui/main_screen.dart';

class AppWidget extends StatelessWidget {
  final AuthRepository authRepository;

  const AppWidget({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider.value(value: authRepository),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child: MaterialApp(
        initialRoute: "/register",
        routes: {
          "/": (context) => MainScreen(),
          "/register": (context) => RegisterPage()
        },
      ),
    );
  }
}