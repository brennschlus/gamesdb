import 'package:dio/dio.dart';
import 'package:gamesdb/models/game_list.dart';
import 'package:gamesdb/secrets/keys.dart';

const String apiKey = rawgAPIKey;
int number = 1;

// RAWG_API_KEY is from https://rawg.io/apidocs

class ApiProvider {
  final Dio _dio = Dio();

  Future<GameList> fetchGameList() async {
    try {
      String _url = 'https://api.rawg.io/api/games?key=$apiKey&page=$number';

      Response response = await _dio.get(_url);

      return GameList.fromJson(response.data);
    } catch (error, stacktrace) {
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");
      return GameList.withError("Data not found / Connection issue");
    }
  }
}
