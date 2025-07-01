import 'package:flutter/material.dart';
import 'package:player2/presentation/providers/auth_provider.dart';
import 'package:player2/presentation/ui/home/home_page.dart';
import 'package:player2/presentation/ui/login/login_page.dart';
import 'package:player2/presentation/ui/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    return StreamBuilder(
      stream: authProvider.authStateChanges(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashPage();
        } else if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      }
    );
  }
}