import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesdb/blocs/gamelist_bloc/gamelist_bloc.dart';
import 'package:gamesdb/cubit/bottom_bar_cubit.dart';
import 'package:gamesdb/presentation/screens/home_page.dart';
import 'package:gamesdb/presentation/screens/main_page.dart';
import 'package:gamesdb/presentation/screens/search_page.dart';
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
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: Typography.whiteHelsinki,
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<GamelistBloc>(
              create: (context) => GamelistBloc(apiRepository),
            ),
            BlocProvider(create: (context) => BottomBarCubit())
          ],
          child: const MainPage(),
        ));
  }
}
