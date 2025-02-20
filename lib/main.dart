import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:player2/app_widget.dart';
import 'package:player2/data/datasource/auth_remote_datasource.dart';
import 'package:player2/data/datasource/auth_remote_datasource_firebase_impl.dart';
import 'package:player2/firebase_options.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AuthRemoteDatasource authRemoteDatasource = AuthRemoteDatasourceFirebaseImpl();

  AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteDatasource: authRemoteDatasource
  );

  runApp(AppWidget(
    authRepository: authRepository,
  ));
}

//dar uma olhada nesse bagulho