import 'package:fave_films/controllers/home/home_screen_controller.dart';
import 'package:fave_films/data/response/request_status.dart';
import 'package:fave_films/models/movie.dart';
import 'package:fave_films/res/routes/route_name.dart';
import 'package:fave_films/res/urls/app_url.dart';
import 'package:fave_films/res/widgets/general_exception_widget.dart';
import 'package:fave_films/res/colors/app_colors.dart';
import 'package:fave_films/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeController());
    homeScreenController.getRxMovies('now_playing');
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.light_mode_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(RouteName.favMoviesScreen);
            },
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ],
      ),
      drawer: const Drawer(),
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
                        onPressed: () {},
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
                              title: results?[index].title ?? '',
                              releaseDate: formatted,
                              overview: results?[index].overview ?? '',
                              posterImageUrl: results?[index].posterPath ?? '',
                              imdbRating: (results?[index].voteAverage ?? 0.0)
                                  .toStringAsFixed(1),
                            );
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: 16.w, bottom: 16.w),
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 195.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AppUrl.tmbdImagesUrl +
                                                    (results?[index]
                                                            .posterPath ??
                                                        ''),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 195.h,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0x30000000),
                                                Color(0x00000000),
                                                Color(0x00000000),
                                                Color(0x30000000),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 4.h,
                                          right: 4.w,
                                          child: Obx(
                                            () => IconButton(
                                              onPressed: () {
                                                if (homeScreenController
                                                    .favoriteMovieIds
                                                    .contains(movie.id)) {
                                                  homeScreenController
                                                      .removeFromFavorites(
                                                          movie);
                                                  homeScreenController
                                                      .removeFromFavoriteMovieIds(
                                                          movie.id);
                                                } else {
                                                  homeScreenController
                                                      .addToFavorites(movie);
                                                  homeScreenController
                                                      .addToFavoriteMovieIds(
                                                          movie.id);
                                                }
                                              },
                                              color: AppColors.orange,
                                              iconSize: 24.sp,
                                              icon: Icon(
                                                homeScreenController
                                                        .favoriteMovieIds
                                                        .contains(movie.id)
                                                    ? Icons.favorite_rounded
                                                    : Icons
                                                        .favorite_border_rounded,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Text(
                                            results?[index].title ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${'released'.tr} : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                color: AppColors.lightGrey,
                                                fontSize: 12.sp,
                                              ),
                                        ),
                                        Text(
                                          formatted,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    Container(
                                      padding: EdgeInsets.all(6.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        color: AppColors.white,
                                      ),
                                      child: Text(
                                        '★ ${results?[index].voteAverage?.toStringAsFixed(1)} IMDb',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: AppColors.black,
                                            ),
                                      ),
                                    ),
                                  ],
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
