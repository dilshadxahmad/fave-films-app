import 'package:fave_films/controllers/home_screen_controller.dart';
import 'package:fave_films/res/colors/app_colors.dart';
import 'package:fave_films/res/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FavMoviesScreen extends StatelessWidget {
  const FavMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Obx(
        () => RawScrollbar(
          radius: Radius.circular(10.r),
          child: ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: homeScreenController.favoriteMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.w),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 195.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                  AppConstants.tmbdImagesUrl +
                                      (homeScreenController
                                          .favoriteMovies[index]
                                          .posterImageUrl),
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
                                if (homeScreenController.favoriteMovies
                                    .contains(homeScreenController
                                        .favoriteMovies[index])) {
                                  homeScreenController.removeFromFavorites(
                                      homeScreenController
                                          .favoriteMovies[index]);
                                } else {
                                  homeScreenController.addToFavorites(
                                      homeScreenController
                                          .favoriteMovies[index]);
                                }
                              },
                              color: AppColors.orange,
                              iconSize: 24.sp,
                              icon: Obx(
                                () => Icon(
                                  homeScreenController.favoriteMovies.contains(
                                          homeScreenController
                                              .favoriteMovies[index])
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
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
                              homeScreenController.favoriteMovies[index].title,
                              style: Theme.of(context).textTheme.labelLarge,
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
                            DateFormat('yyyy').format(homeScreenController
                                .favoriteMovies[index].releaseDate),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: AppColors.white,
                        ),
                        child: Text(
                          "★ ${homeScreenController.favoriteMovies[index].imdbRating} /10",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
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
      ),
    );
  }
}
