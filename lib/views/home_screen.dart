import 'package:fave_films/controllers/home/home_screen_controller.dart';
import 'package:fave_films/data/response/request_status.dart';
import 'package:fave_films/models/favorite/movie.dart';
import 'package:fave_films/res/routes/route_name.dart';
import 'package:fave_films/res/urls/app_url.dart';
import 'package:fave_films/res/widgets/general_exception_widget.dart';
import 'package:fave_films/res/colors/app_colors.dart';
import 'package:fave_films/res/widgets/movie_card_widget.dart';
import 'package:fave_films/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    homeScreenController.getRxMovies('now_playing');

    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteName.favMoviesScreen);
            },
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'app_name'.tr,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            SizedBox(height: 30.h),
            Text('app_version'.tr),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              'find_fav_films_home'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          SizedBox(
            height: 60.h,
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: homeScreenController.rxFilters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: FilterChip(
                      label: Text(homeScreenController.rxFilters[index].title),
                      selected: homeScreenController.rxFilters[index].value,
                      labelStyle: TextStyle(
                        color: homeScreenController.rxFilters[index].value
                            ? AppColors.black
                            : AppColors.lightGrey,
                      ),
                      onSelected: (value) {
                        homeScreenController.setRxFilterValue(index + 1);

                        switch (index) {
                          case 0:
                            homeScreenController.getRxMovies('now_playing');

                          case 1:
                            homeScreenController.getRxMovies('top_rated');

                          case 2:
                            homeScreenController.getRxMovies('popular');

                          case 3:
                            homeScreenController.getRxMovies('upcoming');
                        }
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Expanded(
            child: Obx(
              () {
                switch (homeScreenController.rxRequestStatus.value) {
                  case RequestStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case RequestStatus.error:
                    return Center(
                      child: GeneralExceptionWidget(
                        message: homeScreenController.rxError.toString(),
                        onPressed: () {
                          homeScreenController.setRxFilterValue(1);
                          homeScreenController.getRxMovies('now_playing');
                        },
                      ),
                    );
                  case RequestStatus.completed:
                    final results = homeScreenController
                        .rxMoviesResponseModel.value.results;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RawScrollbar(
                        radius: Radius.circular(10.r),
                        child: MasonryGridView.builder(
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: results?.length ?? 0,
                          itemBuilder: (context, index) {
                            final formatted = HelperFunctions.showYearsFromDate(
                                results?[index].releaseDate ?? '0000-00-00');
                            final movie = Movie(
                              id: results?[index].id ?? 0,
                              title: results?[index].title ?? "",
                              releaseDate: results?[index].releaseDate ?? "",
                              overview: results?[index].overview ?? "",
                              posterImageUrl: results?[index].posterPath ?? "",
                              imdbRating: (results?[index].voteAverage ?? 0.0)
                                  .toString(),
                              isFav: true,
                            );
                            return MovieCardWidget(
                              title: results?[index].title ?? '',
                              backgroundImage: AppUrl.tmbdImagesUrl +
                                  (results?[index].posterPath ?? ''),
                              releasedDate: formatted,
                              imdbRating: (results?[index].voteAverage ?? 0.0)
                                  .toStringAsFixed(1),
                              overlayButton: IconButton(
                                onPressed: () {
                                  homeScreenController.toggleFavorite(movie);
                                },
                                color: AppColors.orange,
                                iconSize: 24.sp,
                                icon: Obx(
                                  () => Icon(
                                    homeScreenController.isMovieFavorite(movie)
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
