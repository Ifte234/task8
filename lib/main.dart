import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/data/bloc/user_bloc.dart';
import 'package:task8/presentation/home_screen/home_screen.dart';
import 'package:task8/utils/Repository/user_repository.dart';

void main() {
  // UserRepository userRepository = UserRepository();
  // userRepository.fetchUsers();
  runApp(const MyApp());
  // Map personmap = jsonDecode(jsonString);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
         home: BlocProvider<UserBloc>(
            create: (context)=>UserBloc()..add(LoadUserEvent()),
          child: HomeScreen(),
            ));
  }
}
