import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:player2/presentation/providers/user_provider.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/password_status.dart';
import 'package:player2/presentation/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_input_v1_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: LoginView(),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      var userProvider = Provider.of<UserProvider>(context, listen: false);

      _emailController = TextEditingController(text: userProvider.email);
      _passwordController = TextEditingController(text: userProvider.password);

      _emailController?.addListener(() {
        final text = _emailController == null ? "" : _emailController!.text;
        userProvider.setEmail(text);
      });

      _passwordController?.addListener(() {
        final text = _passwordController == null ? "" : _passwordController!.text;
        userProvider.setPassword(text);
      });

      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            Text("Back", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            Text("Player", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Text("Sign in with yout accound and find new people to player together", style: TextStyle(fontSize: 16),),
            Divider(
              height: 3,
              color: Colors.black,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 3),
                child: Text("Email"),
              ),
              TextInputV1Widget(
                textController: _emailController,
                isEmailInput: true,
                isPasswordInput: false,
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
                erroText: context.read<UserProvider>().emailStatus == EmailStatus.invalid ? "Email Invalid" : null
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 3),
                child: Text("Password"),
              ),
              TextInputV1Widget(
                textController: _passwordController,
                isEmailInput: false,
                isPasswordInput: true,
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
                erroText: context.read<UserProvider>().passwordStatus == PasswordStatus.needSymble ? "Password invalid: Need a symble" :
                  context.read<UserProvider>().passwordStatus == PasswordStatus.short ? "Password invalid: Need more chars" : 
                  null
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {}, 
                    child: Text("Forgot password?")
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Center(
                  child: ElevatedButtonWidget(
                    onPressed: () {},
                    child: Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Need an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Sign Up ->",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, "/register")
                      )
                    ]
                  )
                ),
              )
          ]
        )
      ),
    );
  }
}