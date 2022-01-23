part of 'gamelist_bloc.dart';

abstract class GamelistEvent extends Equatable {
  const GamelistEvent();
}

class GetGamelist extends GamelistEvent {
  @override
  List<Object> get props => [];
}
