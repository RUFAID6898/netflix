import 'dart:convert';

import 'package:netflix/core/downlod/trend_movie.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUral =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${apiKey}';

  Future<List<Movie>> getTrendingMovie() async {
    final response = await http.get(Uri.parse(_trendingUral));
    if (response.statusCode == 200) {
      final decoData = json.decode(response.body)["results"] as List;
      // print(decoData);
      return decoData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Somthing happend');
    }
  }
}
