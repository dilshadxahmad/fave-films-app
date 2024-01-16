class Movie {
  int? id;
  String? title;
  String? releaseDate;
  String? overview;
  String? posterImageUrl;
  String? imdbRating;
  bool? isFav;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterImageUrl,
    required this.imdbRating,
    required this.isFav,
  });

  Movie.fromJson(Map<String, dynamic> jsonText) {
    id = jsonText['id'];
    title = jsonText['title'];
    releaseDate = jsonText['releaseDate'];
    overview = jsonText['overview'];
    posterImageUrl = jsonText['posterImageUrl'];
    imdbRating = jsonText['imdbRating'];
    isFav = jsonText['isFav'];
  }

  // factory Movie.fromJsonNew(Map<String, dynamic> parsedJson) {
  //   return Movie(
  //       id: parsedJson['id'],
  //       title: parsedJson['title'],
  //       releaseDate: parsedJson['releaseDate'],
  //       overview: parsedJson['overview'],
  //       posterImageUrl: parsedJson['posterImageUrl'],
  //       imdbRating: parsedJson['imdbRating']);
  // }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'releaseDate': releaseDate,
        'overview': overview,
        'posterImageUrl': posterImageUrl,
        'imdbRating': imdbRating,
        'isFav': isFav
      };
}
