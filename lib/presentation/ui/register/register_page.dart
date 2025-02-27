import 'package:flutter/material.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/domain/usecases/register_user_usecase.dart';
import 'package:player2/presentation/providers/auth_provider.dart';
import 'package:player2/presentation/ui/register/register_content_01.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: RegisterContent01(),
      ),
    );
  }
}
