import 'package:flutter/material.dart';

class RegisterContent02 extends StatelessWidget {
  const RegisterContent02({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Description"),
        TextFormField(),
        Text("Discord"),
        TextFormField()
      ],
    );
  }
}