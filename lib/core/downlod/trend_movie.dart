import 'package:flutter/foundation.dart';

class Movie {
  String posterpath;
  Movie({required this.posterpath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(posterpath: json['poster_path']);
  }
}
