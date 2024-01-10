import 'package:fave_films/models/movie.dart';
import 'package:fave_films/utils/constants/app_constants.dart';
import 'package:fave_films/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future(() => null),
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: mockMovies.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.asset(
                      AppConstants.assetImagesUrl +
                          AppImages.onboardingScreenIllustration,
                    ),
                    Text(mockMovies[index].title),
                    Text(mockMovies[index].releaseDate.toString()),
                    Text(mockMovies[index].overview),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
