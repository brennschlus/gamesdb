import 'package:gamesdb/data/api_provider.dart';
import 'package:gamesdb/models/game_list.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<GameList> fetchGameList() {
    return _provider.fetchGameList();
  }
}

class NetworkError extends Error {}
