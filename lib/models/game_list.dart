import 'package:gamesdb/models/game.dart';

class GameList {
  String? next;
  String? previous;
  List<Game>? results;
  String? error;

  GameList({this.next, this.results, this.previous});

  GameList.withError(String errorMessage) {
    error = errorMessage;
  }

  GameList.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Game>[];
      json['results'].forEach((v) {
        results?.add(Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
