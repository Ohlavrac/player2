import 'package:flutter/material.dart';
import 'package:player2/presentation/providers/user_provider.dart';
import 'package:player2/presentation/status/bday_status.dart';
import 'package:player2/presentation/status/email_status.dart';
import 'package:player2/presentation/status/username_status.dart';
import 'package:player2/presentation/widgets/elevated_button_widget.dart';
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

  DateTime? selectedDate;
  Future<void> _selectDate() async {
    final DateTime? pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-100), 
      lastDate: DateTime.now()
    );

    setState(() {
      selectedDate = pickDate;
      context.read<UserProvider>().setBday(pickDate!);
    });
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Born Day"),
            ),
            OutlinedButton(
              onPressed: _selectDate,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                //backgroundColor: context.read<UserProvider>().bdayStatus == BdayStatus.invalid ? Colors.red : Colors.blue 
              ),
              child: Text(selectedDate == null ? "Date" : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}")
            ),
            context.read<UserProvider>().bdayStatus == BdayStatus.invalid ? Text("Idade invalida", style: TextStyle(color: Colors.red, fontSize: 14),) : Container(),
            SizedBox(height: 30,),
            Center(child: ElevatedButtonWidget(
              onPressed: () {
                if (context.read<UserProvider>().usernameStatus == UsernameStatus.valid && 
                    context.read<UserProvider>().emailStatus == EmailStatus.valid &&
                    context.read<UserProvider>().passwordStatus == PasswordStatus.valid &&
                    context.read<UserProvider>().bdayStatus == BdayStatus.valid) {
                  Navigator.pushNamed(context, "/register/informations");
                } else {
                  print("PERA LA CAMARAD");
                  print("${context.read<UserProvider>().getusername} | ${context.read<UserProvider>().getemail} | ${context.read<UserProvider>().getpassword}");
                }
              }, 
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