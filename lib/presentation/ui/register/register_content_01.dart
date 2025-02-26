import 'package:flutter/material.dart';
import 'package:player2/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
            TextFormField(
              controller: _usernameController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text("Email"),
            ),
            TextFormField(
              controller: _emailController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 3),
              child: Text("Password"),
            ),
            TextFormField(
              controller: _passwordController,
            ),
            SizedBox(height: 30,),
            Center(child: ElevatedButton(
                onPressed: () {
                  print(context.read<UserProvider>().getusername);
                },
                child: Text("Register")
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already hava account ?"),
                TextButton(onPressed: () {}, child: Text("Login"))
              ],
            ),
          ]
        ),
    );
  }
}