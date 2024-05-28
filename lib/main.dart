import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task8/data/bloc/user_bloc.dart';
import 'package:task8/presentation/home_screen/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task8/utils/Repository/user_repository.dart';

import 'Services/model/my_data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Hive.initFlutter();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MyPageAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.openBox<MyPage>('user');
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
