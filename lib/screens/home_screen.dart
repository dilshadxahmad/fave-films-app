import 'package:fave_films/models/movie.dart';
import 'package:fave_films/screens/fav_movies_screen.dart';
import 'package:fave_films/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fave Films"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const FavMoviesScreen());
            },
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Your Favorite Films and Create a Personalised list.",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 60.h,
              child: ListView(
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
                future: Future(() => null),
                builder: (context, snapshot) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300.h,
                    ),
                    itemCount: mockMovies.length,
                    itemBuilder: (context, index) {
                      final formatted = DateFormat('yyyy')
                          .format(mockMovies[index].releaseDate);
                      return Padding(
                        padding: EdgeInsets.all(8.w),
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
                                        image: AssetImage(
                                          mockMovies[index].posterImageUrl,
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
                                        if (Get.isSnackbarOpen) {
                                          Get.closeCurrentSnackbar();
                                        } else {
                                          Get.snackbar(
                                            "title",
                                            "message",
                                          );
                                        }
                                      },
                                      color: AppColors.orange,
                                      iconSize: 24.sp,
                                      icon: const Icon(
                                          Icons.favorite_outline_rounded),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      mockMovies[index].title,
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
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
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
                                  "★ 7.8/10",
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
