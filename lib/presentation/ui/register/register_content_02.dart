import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/presentation/providers/auth_provider.dart';
import 'package:player2/presentation/status/plataforms_status.dart';
import 'package:player2/presentation/widgets/elevated_button_widget.dart';
import 'package:player2/presentation/widgets/text_input_v1_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class RegisterContent02 extends StatefulWidget {
  const RegisterContent02({super.key});

  @override
  State<RegisterContent02> createState() => _RegisterContent02State();
}

class _RegisterContent02State extends State<RegisterContent02> {

  TextEditingController? _descriptionController;
  TextEditingController? _discordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var providerss = Provider.of<UserProvider>(context, listen: false);

      _descriptionController = TextEditingController(text: providerss.description);
      _discordController = TextEditingController(text: providerss.discord);

      _descriptionController?.addListener(() {
        final text = _descriptionController == null ? "" : _descriptionController!.text;
        providerss.setUsername(text);
      });

      _discordController?.addListener(() {
        final text = _discordController == null ? "" : _discordController!.text;
        providerss.setEmail(text);
      });

      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    _descriptionController?.dispose();
    _discordController?.dispose();
    super.dispose();
  }

  Map<String, dynamic> plataformsMap = {
    "Computer": false,
    "PS3": false,
    "PS4": false,
    "PS5": false,
    "X360": false,
    "XONE": false,
    "XONE-S": false,
    "Switch": false
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("More About", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
          Text("You", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text("Your account is close to be created, after that please, tell more about you.", style: TextStyle(fontSize: 16),),
            Divider(color: Colors.black, thickness: 2,),
          Text("Description:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextInputV1Widget(
              textController: _descriptionController, 
              isPasswordInput: false, 
              isEmailInput: false,
              maxLines: 5,
            ),
          ),
          Text("Discord:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextInputV1Widget(
              textController: _discordController, 
              isPasswordInput: false, 
              isEmailInput: false
            ),
          ),
          Text("Plataforms:"),
      
          context.read<UserProvider>().plataformsStatus == PlataformsStatus.invalid ? Text("Select one or more plataforms do you use to play.", style: TextStyle(color: Colors.red),) : Container(),
          
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              itemCount: plataformsMap.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 4
              ), 
              itemBuilder: (context, index) {
                return OutlinedButton(
                  onPressed: () {
      
                    setState(() {
                      if (plataformsMap[plataformsMap.keys.elementAt(index)] == true) {
                        plataformsMap[plataformsMap.keys.elementAt(index)] = false;
                      } else {
                        plataformsMap[plataformsMap.keys.elementAt(index)] = true;
                      }
                    });
      
                    context.read<UserProvider>().setPlatforms(plataformsMap);
                  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: plataformsMap.values.elementAt(index) == true ? Colors.amber : Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  child: Text(plataformsMap.keys.elementAt(index))
                );
              }),
          ),
          Center(
            child: ElevatedButtonWidget(
              onPressed: () {
                if (context.read<UserProvider>().plataformsStatus == PlataformsStatus.valid) {
                  
                  UserEntity newUser = UserEntity(
                    username: context.read<UserProvider>().username,
                    email: context.read<UserProvider>().email,
                    password: context.read<UserProvider>().password,
                    bday: context.read<UserProvider>().bday,
                    description: context.read<UserProvider>().description,
                    discord: context.read<UserProvider>().discord,
                    platforms: context.read<UserProvider>().platforms,
                  );
      
                  context.read<AuthProvider>().registerUser(newUser).whenComplete(() {
                    Navigator.pushNamed(context, "/register/completed");
                  });
      
                  context.read<UserProvider>().cleanUserProdiver();
                  context.read<UserProvider>().resetAllStatus();
                } else {
                  setState(() {
                    context.read<UserProvider>().verifyFields(["platforms"]);
                  });
                }
              }, 
              child: Text("Create account", style: TextStyle(color: Colors.white),)
            ),
          ),
        ],
      ),
    );
  }
}