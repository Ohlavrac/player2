import 'package:flutter/material.dart';
import 'package:player2/presentation/ui/register_screen.dart';

import 'presentation/ui/main_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/register",
      routes: {
        "/": (context) => MainScreen(),
        "/register": (context) => RegisterScreen()
      },
    );
  }
}