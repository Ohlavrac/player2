import 'package:flutter/material.dart';
import 'package:player2/presentation/ui/register/register_content_02.dart';

class RegisterPage2 extends StatelessWidget {
  const RegisterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterPage2View();
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: RegisterContent02(),
      ),
    );
  }
}