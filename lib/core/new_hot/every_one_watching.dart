class NewHotEveryOneWatchind {
  String title;
  String overview;
  String posterpath;
  String date;
  NewHotEveryOneWatchind({
    required this.date,
    required this.overview,
    required this.posterpath,
    required this.title,
  });

  factory NewHotEveryOneWatchind.fromJson(Map<String, dynamic> json) {
    return NewHotEveryOneWatchind(
        date: json["release_date"],
        overview: json["overview"],
        posterpath: json["poster_path"],
        title: json["original_title"]);
  }
}
