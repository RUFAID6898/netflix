// import 'dart:convert';

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/core/home/home_trend.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  static const _homemove =
      "https://api.themoviedb.org/3/tv/popular?api_key=${apiKey}";

  Future<List<HomeMovie>> getterndhome() async {
    final respons = await http.get(Uri.parse(_homemove));
    if (respons.statusCode == 200) {
      final decoData = json.decode(respons.body)["results"] as List;
      print(decoData.toString());
      return decoData.map((e) => HomeMovie.fromJson(e)).toList();
    } else {
      throw Exception('somthing happend');
    }
  }
}
