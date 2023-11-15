import 'dart:convert';

import 'package:netflix/core/new_hot/every_one_watching.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;

class EveryOneWtching {
  static const _everyonewatchUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${apiKey}';

  Future<List<NewHotEveryOneWatchind>> geteveryonewatch() async {
    final repose = await http.get(Uri.parse(_everyonewatchUrl));
    if (repose.statusCode == 200) {
      final decode = json.decode(repose.body)["results"] as List;
      print(decode.toString());
      return decode
          .map((every) => NewHotEveryOneWatchind.fromJson(every))
          .toList();
    } else {
      throw Exception('somthing happend');
    }
  }
}
