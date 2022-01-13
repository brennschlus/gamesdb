import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamesdb/models/game_list.dart';
import 'package:gamesdb/repositories/api_repository.dart';

part 'gamelist_event.dart';
part 'gamelist_state.dart';

class GamelistBloc extends Bloc<GamelistEvent, GamelistState> {
  ApiRepository apiRepository = ApiRepository();

  GamelistBloc(this.apiRepository) : super(GamelistInitial()) {
    on<GetGamelist>((event, emit) async {
      emit(const GamelistLoading());
      try {
        emit(const GamelistLoading());

        final gameList = await apiRepository.fetchGameList();
        emit(GamelistLoaded(gameList));

        //    print(gameList.results?[0].id);
        if (gameList.error != null) {
          emit(GamelistError(gameList.error as String));
        }
      } on NetworkError {
        emit(const GamelistError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
