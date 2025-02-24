import 'package:flutter/material.dart';

class RegisterContent01 extends StatelessWidget {
  const RegisterContent01({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("Create", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            Text("Account", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text("Username"),
            ),
            TextFormField(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text("Email"),
            ),
            TextFormField(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text("Password"),
            ),
            TextFormField(),
          ]
        ),
    );
  }
}