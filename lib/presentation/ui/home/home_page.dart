import 'package:flutter/material.dart';
import 'package:player2/domain/entities/user_entity.dart';
import 'package:player2/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    UserEntity? userInfos = context.read<UserProvider>().user;
    var provider = context.read<UserProvider>();
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SALVE CARA ${userInfos?.email}"),
              ElevatedButton(
                onPressed: () {
                  provider.logoutUser();
                  Navigator.pushReplacementNamed(context, "/login");
                }, 
                child: Text("Logout")
              )
            ],
          ),
        ),
      ),
    );
  }
}