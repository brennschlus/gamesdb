import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesdb/blocs/bloc/bloc/gamelist_bloc.dart';
import 'package:gamesdb/presentation/screens/home_page.dart';
import 'package:gamesdb/repositories/api_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiRepository apiRepository = ApiRepository();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<GamelistBloc>(
          create: (context) => GamelistBloc(apiRepository),
          child: const HomePage(),
        ));
  }
}
