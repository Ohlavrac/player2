import 'package:flutter/material.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';
import 'package:player2/presentation/providers/auth_provider.dart';
import 'package:player2/presentation/ui/register_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/ui/main_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            registerUserUsecase: RegisterUserUsecase(repository:   context.read<AuthRepository>())
          )
        ),
      ],
      child: MaterialApp(
        initialRoute: "/register",
        routes: {
          "/": (context) => MainScreen(),
          "/register": (context) => RegisterScreen()
        },
      ),
    );
  }
}