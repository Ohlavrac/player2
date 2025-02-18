import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Email: "),
          TextFormField(
            onFieldSubmitted: (value) {},
          ),
          Text("Password: "),
          TextFormField(
            onFieldSubmitted: (value) {},
          ),
          ElevatedButton(onPressed: () {}, child: Text("Register"))
        ],
      ),
    );
  }
}