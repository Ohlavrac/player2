import 'package:flutter/material.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/domain/usecases/auth_state_changes_usecase.dart';
import 'package:player2/domain/usecases/get_logged_user_uscase.dart';
import 'package:player2/domain/usecases/logout_usecase.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';
import 'package:player2/presentation/providers/auth_provider.dart';
import 'package:player2/presentation/ui/auth_wrapper/auth_wrapper.dart';
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

    //TODO POR O PROVIDER DE AUTH AQUI ?

    return MultiProvider(
      providers: [
        Provider.value(value: authRepository),
        ChangeNotifierProvider(create: (context) => UserProvider(
          getLoggedUserUscase: GetLoggedUserUscase(repository: authRepository), 
          logoutUsecase: LogoutUsecase(repository: authRepository)
          
        ),),
        ChangeNotifierProvider(create: (context) => AuthProvider(
          registerUserUsecase: RegisterUserUsecase(repository: authRepository),
          authStateChangesUsecase: AuthStateChangesUsecase(repository: authRepository)
        ))
      ],
      child: MaterialApp(
        home: AuthWrapper(),
        routes: {
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/register/informations": (context) => RegisterPage2(),
          "/register/completed": (context) => RegisterCompletedPage()
        },
      ),
    );
  }
}