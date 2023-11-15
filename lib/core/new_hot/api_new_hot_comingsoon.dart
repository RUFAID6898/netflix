import 'dart:convert';

// import 'package:netflix/core/colors/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;

class NewHotApi {
  static const _hotnewUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}";
  Future<List<NewHot>> getHotDtils() async {
    final resons = await http.get(Uri.parse(_hotnewUrl));
    if (resons.statusCode == 200) {
      final decodData = json.decode(resons.body)["results"] as List;
      print(decodData.toString());
      return decodData.map((trend) => NewHot.fromJson(trend)).toList();
    } else {
      throw Exception('somthing  happend');
    }
  }
}
