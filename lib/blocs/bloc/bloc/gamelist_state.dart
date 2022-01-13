part of 'gamelist_bloc.dart';

abstract class GamelistState extends Equatable {
  const GamelistState();

  @override
  List<Object> get props => [];
}

class GamelistInitial extends GamelistState {}

class GamelistLoading extends GamelistState {
  const GamelistLoading();

  @override
  List<Object> get props => [];
}

class GamelistLoaded extends GamelistState {
  final GameList gameList;
  const GamelistLoaded(this.gameList);

  @override
  List<Object> get props => [gameList];
}

class GamelistError extends GamelistState {
  final String message;
  const GamelistError(this.message);
  @override
  List<Object> get props => [message];
}
