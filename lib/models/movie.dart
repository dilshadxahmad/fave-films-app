class Movie {
  final int id;
  final String title;
  final DateTime releaseDate;
  final String overview;
  final String posterImageUrl;
  final String imdbRating;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterImageUrl,
    required this.imdbRating,
  });
}
