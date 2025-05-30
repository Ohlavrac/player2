import 'package:flutter/material.dart';
import 'package:player2/presentation/widgets/elevated_button_widget.dart';

class RegisterCompletedPage extends StatelessWidget {
  const RegisterCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterCompletedView(),
    );
  }
}

class RegisterCompletedView extends StatelessWidget {
  const RegisterCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Account created successfully", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, height: 1), textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Icon(Icons.check_box, color: Colors.green, size: 200,),
          ),
          ElevatedButtonWidget(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/login");
            },
            child: Text("Go Login Page", style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }
}