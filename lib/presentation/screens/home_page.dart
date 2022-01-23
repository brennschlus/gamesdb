import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesdb/blocs/gamelist_bloc/gamelist_bloc.dart';
import 'package:gamesdb/models/game.dart';
import 'package:gamesdb/models/game_list.dart';
import 'package:gamesdb/presentation/widgets/game_card.dart';
import 'package:gamesdb/presentation/widgets/search_pages.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GamelistBloc gamelistBloc = BlocProvider.of<GamelistBloc>(context);
    gamelistBloc.add(GetGamelist()); // fetching api data on initialisation
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          children: [
            BlocBuilder<GamelistBloc, GamelistState>(
              builder: (context, state) {
                if (state is GamelistLoading) {
                  //  return const CircularProgressIndicator();
                  List<Widget> placeholder = List.generate(
                    20,
                    (index) => Shimmer(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 400,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                    ),
                  );
                  return Expanded(
                    child: ListView(children: placeholder),
                  );
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
            ),
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
