class Movie {
  final int id;
  final String title;
  final DateTime releaseDate;
  final String overview;
  final String posterImageUrl;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterImageUrl,
  });
}

final mockMovies = [
  Movie(
    id: 1,
    title: "Lord of Rings",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: "posterImageUrl",
  ),
  Movie(
    id: 2,
    title: "Lord of Rings",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: "posterImageUrl",
  ),
  Movie(
    id: 3,
    title: "Lord of Rings",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: "posterImageUrl",
  ),
  Movie(
    id: 4,
    title: "Lord of Rings",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: "posterImageUrl",
  ),
];
