import 'package:flutter/material.dart';
import 'package:player2/presentation/ui/register/register_content_02.dart';
import 'package:provider/provider.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/usecases/register_user_usecase.dart';
import '../../providers/auth_provider.dart';

class RegisterPage2 extends StatelessWidget {
  const RegisterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(registerUserUsecase: RegisterUserUsecase(repository: context.read<AuthRepository>())),
      child: RegisterPage2View(),
    );
  }
}

class RegisterPage2View extends StatefulWidget {
  const RegisterPage2View({super.key});

  @override
  State<RegisterPage2View> createState() => _RegisterPage2ViewState();
}

class _RegisterPage2ViewState extends State<RegisterPage2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RegisterContent02(),
      ),
    );
  }
}