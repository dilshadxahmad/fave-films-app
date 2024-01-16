import 'package:fave_films/controllers/home/home_screen_controller.dart';
import 'package:fave_films/models/favorite/movie.dart';
import 'package:fave_films/res/colors/app_colors.dart';
import 'package:fave_films/res/urls/app_url.dart';
import 'package:fave_films/res/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavMoviesScreen extends StatelessWidget {
  const FavMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'.tr),
        actions: [
          if (homeScreenController.rxFavMovies.isNotEmpty)
            IconButton(
              onPressed: () async {
                homeScreenController.clearFavMovies();
                Get.snackbar(
                  "bro".tr,
                  "favorites_cleared".tr,
                  colorText: Theme.of(context).textTheme.bodyMedium?.color,
                  duration: const Duration(seconds: 1),
                );
              },
              icon: const Icon(Icons.delete_outline_rounded),
            ),
        ],
      ),
      body: Obx(
        () {
          if (homeScreenController.rxFavMovies.isNotEmpty) {
            return ListView.builder(
              itemCount: homeScreenController.rxFavMovies.length,
              itemBuilder: (context, index) {
                final movie = Movie(
                  id: homeScreenController.rxFavMovies[index].id ?? 0,
                  title: homeScreenController.rxFavMovies[index].title ?? "",
                  releaseDate:
                      homeScreenController.rxFavMovies[index].releaseDate ?? "",
                  overview:
                      homeScreenController.rxFavMovies[index].overview ?? "",
                  posterImageUrl:
                      homeScreenController.rxFavMovies[index].posterImageUrl ??
                          "",
                  imdbRating:
                      (homeScreenController.rxFavMovies[index].imdbRating ??
                              0.0)
                          .toString(),
                  isFav: true,
                );
                return MovieCardWidget(
                  title: homeScreenController.rxFavMovies[index].title ?? '',
                  backgroundImage: AppUrl.tmbdImagesUrl +
                      (homeScreenController.rxFavMovies[index].posterImageUrl ??
                          ''),
                  releasedDate:
                      homeScreenController.rxFavMovies[index].releaseDate ?? "",
                  imdbRating:
                      homeScreenController.rxFavMovies[index].imdbRating ?? "",
                  overlayButton: IconButton(
                    onPressed: () {
                      homeScreenController.toggleFavorite(movie);
                    },
                    color: AppColors.orange,
                    iconSize: 24.sp,
                    icon: Icon(
                      homeScreenController.isMovieFavorite(movie)
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text(
              'no_favorites_added_yet'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          );
        },
      ),
    );
  }
}
