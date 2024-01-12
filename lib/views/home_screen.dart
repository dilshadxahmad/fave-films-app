import 'package:fave_films/controllers/home_screen_controller.dart';
import 'package:fave_films/models/movie.dart';
import 'package:fave_films/network/response_models/movies_response_model.dart';
import 'package:fave_films/views/fav_movies_screen.dart';
import 'package:fave_films/services/movies_api_service.dart';
import 'package:fave_films/utils/constants/app_colors.dart';
import 'package:fave_films/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MoviesResponseModel> moviesData;
  final _homeScreenController = Get.put(HomeScreenController());

  @override
  void initState() {
    super.initState();
    moviesData = MoviesApiService.getMovies(type: "popular");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fave Films"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.light_mode_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const FavMoviesScreen());
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
              "Find Your Favorite Films and Create a Personalised list.",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          SizedBox(
            height: 60.h,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: FilterChip(
                    label: const Text("All"),
                    onSelected: (value) {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: FilterChip(
                    label: const Text("Popular"),
                    onSelected: (value) {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: FilterChip(
                    label: const Text("Top Rated"),
                    onSelected: (value) {},
                    selected: true,
                    labelStyle: const TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: FilterChip(
                    label: const Text("Upcoming"),
                    onSelected: (value) {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: moviesData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: RawScrollbar(
                      radius: Radius.circular(10.r),
                      child: MasonryGridView.builder(
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.results?.length,
                        itemBuilder: (context, index) {
                          final dateTime = DateTime.parse(
                              snapshot.data!.results?[index].releaseDate ??
                                  "2011-11-11");
                          final formatted = DateFormat('yyyy').format(dateTime);
                          final movie = Movie(
                            id: snapshot.data!.results?[index].id ?? 0,
                            title: snapshot.data!.results?[index].title ?? "",
                            releaseDate: dateTime,
                            overview:
                                snapshot.data!.results?[index].overview ?? "",
                            posterImageUrl:
                                snapshot.data!.results?[index].posterPath ?? "",
                            imdbRating: snapshot
                                    .data!.results?[index].voteAverage
                                    .toString() ??
                                "",
                          );
                          return Padding(
                            padding: EdgeInsets.only(right: 16.w, bottom: 16.w),
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
                                              AppConstants.tmbdImagesUrl +
                                                  (snapshot
                                                          .data!
                                                          .results?[index]
                                                          .posterPath ??
                                                      ""),
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
                                        child: IconButton(
                                          onPressed: () {
                                            if (_homeScreenController
                                                .favoriteMovies
                                                .contains(movie)) {
                                              _homeScreenController
                                                  .removeFromFavorites(movie);
                                            } else {
                                              _homeScreenController
                                                  .addToFavorites(movie);
                                            }
                                          },
                                          color: AppColors.orange,
                                          iconSize: 24.sp,
                                          icon: Obx(
                                            () => Icon(
                                              _homeScreenController
                                                      .favoriteMovies
                                                      .contains(movie)
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
                                          snapshot.data!.results?[index]
                                                  .title ??
                                              "",
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
                                        'released : ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              color: AppColors.lightGrey,
                                              fontSize: 12.sp,
                                            ),
                                      ),
                                      Text(
                                        formatted.toString(),
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
                                      "★ ${snapshot.data!.results?[index].voteAverage?.toStringAsFixed(1)} /10",
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
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Text("No data");
              },
            ),
          ),
        ],
      ),
    );
  }
}
