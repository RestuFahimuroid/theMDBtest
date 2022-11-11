import 'dart:convert';
import 'package:http/http.dart';
import 'package:themoviedbtest/model/popular_movie.dart';

class ApiProvider {
  String apiKey = '36696832342421704e36743517abeacd';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
