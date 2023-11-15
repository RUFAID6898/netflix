// import 'dart:js_interop';

class NewHot {
  String postrpath;
  String title;
  String overview;
  NewHot({
    required this.postrpath,
    required this.overview,
    required this.title,
  });

  factory NewHot.fromJson(Map<String, dynamic> json) {
    return NewHot(
        postrpath: json["poster_path"],
        overview: json["overview"],
        title: json["title"]);
  }
}
