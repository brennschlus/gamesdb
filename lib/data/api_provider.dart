import 'package:dio/dio.dart';
import 'package:gamesdb/models/game_list.dart';
import 'package:gamesdb/secrets/keys.dart';

final String apiKey = rawgAPIKey;

// RAWG_API_KEY is from https://rawg.io/apidocs

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.rawg.io/api/games?key=$apiKey';

  Future<GameList> fetchGameList() async {
    try {
      Response response = await _dio.get(_url);
      return GameList.fromJson(response.data);
    } catch (error, stacktrace) {
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");
      return GameList.withError("Data not found / Connection issue");
    }
  }
}
