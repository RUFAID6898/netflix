class HomeMovie {
  String poster;
  // String title;
  // String overview;

  HomeMovie({
    required this.poster,
    // required this.overview,
    // required this.title,
  });

  factory HomeMovie.fromJson(Map<String, dynamic> json) {
    return HomeMovie(
      poster: json["poster_path"],
      // overview: json["overview"],
      // title: json["title"]
    );
  }
}
