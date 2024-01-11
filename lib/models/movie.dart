import 'package:fave_films/utils/constants/app_constants.dart';
import 'package:fave_films/utils/constants/app_images.dart';

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
    title: "Leo",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: AppConstants.assetImagesUrl + AppImages.moviePoster,
  ),
  Movie(
    id: 2,
    title: "Freelance",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: AppConstants.assetImagesUrl + AppImages.moviePoster2,
  ),
  Movie(
    id: 3,
    title: "Dead for a Dollar",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: AppConstants.assetImagesUrl + AppImages.moviePoster3,
  ),
  Movie(
    id: 4,
    title: "Exorcist",
    releaseDate: DateTime.parse("2012-02-27"),
    overview: "overview",
    posterImageUrl: AppConstants.assetImagesUrl + AppImages.moviePoster4,
  ),
];
