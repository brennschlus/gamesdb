import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesdb/cubit/bottom_bar_cubit.dart';
import 'package:gamesdb/presentation/screens/home_page.dart';
import 'package:gamesdb/presentation/screens/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomePage(),
      const SearchPage(),
      const Center(
        child: Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
      )
    ];
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.grey[850],
            currentIndex: context.read<BottomBarCubit>().state,
            onTap: (index) => context.read<BottomBarCubit>().updateIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              )
            ],
          ),
        );
      },
    );
  }
}
