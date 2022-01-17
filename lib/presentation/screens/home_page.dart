import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesdb/blocs/bloc/bloc/gamelist_bloc.dart';
import 'package:gamesdb/models/game.dart';
import 'package:gamesdb/models/game_list.dart';
import 'package:gamesdb/presentation/widgets/game_card.dart';
import 'package:gamesdb/presentation/widgets/search_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GamelistBloc gamelistBloc = BlocProvider.of<GamelistBloc>(context);
    gamelistBloc.add(GetGamelist()); // fetching api data on initialisation
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  gamelistBloc.add(GetGamelist());
                },
                child: const Text('Fetch games')),
            BlocBuilder<GamelistBloc, GamelistState>(
              builder: (context, state) {
                if (state is GamelistLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GamelistLoaded) {
                  List<GameCard> listGames = List.generate(20, (index) {
                    GameList gameList = state.gameList;
                    return GameCard(
                        game: Game(
                            id: gameList.results?[index].id,
                            name: state.gameList.results?[index].name,
                            image: state.gameList.results?[index].image,
                            metaCritic:
                                state.gameList.results?[index].metaCritic));
                  });
                  return Expanded(
                    child: Column(
                      children: [
                        buildCard(context, listGames),
                        const SearchPages()
                      ],
                    ),
                  );
                } else if (state is GamelistError) {
                  return Container();
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCard(BuildContext context, List<GameCard> listGames) {
  return Expanded(
      child: ListView(
    cacheExtent: 999999999999999,
    children: listGames,
  ));
}
