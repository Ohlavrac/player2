//PAGE

import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';
import 'package:player2/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

//PAGE

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(registerUserUsecase: RegisterUserUsecase(repository: context.read<AuthRepository>())),
      child: RegisterView(),
    );
  }
}

//VIEW

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                UserEntity user = UserEntity(
                  email: "seil2a@gmail.com",
                  password: "q2eqeddwd",
                  username: "conta fake",
                  description: "conta fake dosa",
                  imageUrl: "sem foto",
                  platforms: ["PC", "Steam", "Suvaco"],
                  discord: "seiladiscord",
                  postsIds: [],
                  bday: DateTime.now(),
                  userCreatedAt: DateTime.now()
                );

                context.read<AuthProvider>().registerUser(user);

                print("OK");
              },
              child: Text("Register")
            )
          ],
        ),
      ),
    );
  }
}
