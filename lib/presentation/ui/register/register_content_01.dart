import 'package:flutter/material.dart';
import 'package:player2/presentation/providers/user_provider.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/username_status.dart';
import 'package:player2/presentation/widgets/text_input_v1_widget.dart';
import 'package:provider/provider.dart';

import '../../status/password_status.dart';

class RegisterContent01 extends StatefulWidget {
  const RegisterContent01({super.key});

  @override
  State<RegisterContent01> createState() => _RegisterContent01State();
}

class _RegisterContent01State extends State<RegisterContent01> {

  TextEditingController? _emailController;
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var providerss = Provider.of<UserProvider>(context, listen: false);

      _usernameController = TextEditingController(text: providerss.username);
      _emailController = TextEditingController(text: providerss.email);
      _passwordController = TextEditingController(text: providerss.password);

      _usernameController?.addListener(() {
        final text = _usernameController == null ? "" : _usernameController!.text;
        providerss.setUsername(text);
      });

      _emailController?.addListener(() {
        final text = _emailController == null ? "" : _emailController!.text;
        providerss.setEmail(text);
      });

      _passwordController?.addListener(() {
        final text = _passwordController == null ? "" : _passwordController!.text;
        providerss.setPassword(text);
      });

      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("Create", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            Text("Account", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Text("Create your account and find new friends to play games together.", style: TextStyle(fontSize: 16),),
            Divider(color: Colors.black, thickness: 2,),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text("Username"),
            ),
            TextInputV1Widget(
              textController: _usernameController,
              isEmailInput: false,
              isPasswordInput: false,
              onChanged: (value) {
                setState(() {
                  
                });
              },
              erroText: context.read<UserProvider>().usernameStatus == UsernameStatus.invalid ? "Username Invalid" : null,
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
            Text("Born Day"),
            OutlinedButton(onPressed: () {}, child: Text("Date")),
            SizedBox(height: 30,),
            Center(child: ElevatedButton(
                onPressed: () {
                  if (context.read<UserProvider>().usernameStatus == UsernameStatus.valid && 
                      context.read<UserProvider>().emailStatus == EmailStatus.valid &&
                      context.read<UserProvider>().passwordStatus == PasswordStatus.valid) {
                    Navigator.pushNamed(context, "/register/informations");
                  } else {
                    print("PERA LA CAMARAD");
                    print("${context.read<UserProvider>().getusername} | ${context.read<UserProvider>().getemail} | ${context.read<UserProvider>().getpassword}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Color(0xff23211F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)
                  ),
                  textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)
                ),
                child: Text("Register", style: TextStyle(color: Colors.white),)
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already hava account ?", style: TextStyle(fontSize: 16),),
                TextButton(onPressed: () {}, child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),))
              ],
            ),
          ]
        ),
    );
  }
}