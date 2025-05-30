import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/domain/repositories/auth_repository.dart';
import 'package:player2/domain/usecases/get_logged_user_uscase.dart';
import 'package:player2/domain/usecases/login_user_usecase.dart';
import 'package:player2/presentation/providers/auth_login_provider.dart';
import 'package:player2/presentation/providers/user_provider.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/password_status.dart';
import 'package:player2/presentation/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_input_v1_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthLoginProvider _authLoginProvider;

  @override
  void initState() {
    super.initState();
    _authLoginProvider = AuthLoginProvider(loginUserUsecase: LoginUserUsecase(authRepository: context.read<AuthRepository>()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: _authLoginProvider),
          ],
          
          child: LoginView()
        ),
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

  bool hasError = false;
  String erroMesage = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      var userProvider = context.read<UserProvider>();

      userProvider.checkLoggedUser();
      
      if (userProvider.user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }

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
            /*Consumer<UserProvider>(
              builder: (context, provider, __) {
                if (provider.user == null) {
                  return Text("OFF");
                } else {
                  return Text("ON: ${provider.user!.email}");
                }
              }
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text("Sign in with yout accound and find new people to player together", style: TextStyle(fontSize: 16),),
            ),
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
                    onPressed: () async {
                      UserEntity user = UserEntity(email: _emailController!.text, password: _passwordController!.text);
    
                      try {
                        await context.read<AuthLoginProvider>().login(user);
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              title: Text("OK"),
                              content: Text("OK", style: TextStyle(color: Colors.red),),
                            );
                          }
                        );
                      } catch (erro) {
                        if (!context.mounted) return;
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text(erro.toString(), style: TextStyle(color: Colors.red),),
                            );
                          }
                        );
                      }
    
                      if (!context.mounted) return;
    
                      context.read<UserProvider>().cleanUserProdiver();
                      context.read<UserProvider>().resetAllStatus();
                      hasError = false;
                      erroMesage = "";
                      setState(() {
                        
                      });
                    },
                    child: Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Need an account ? ",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: " Sign Up ->",
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